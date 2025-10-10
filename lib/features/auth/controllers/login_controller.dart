import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tt_clone/core/common/presentation/widgets/app_snack_bar.dart';
import 'package:tt_clone/core/services/auth_service.dart';
import 'package:tt_clone/core/utils/constants/api_constants.dart';
import 'package:tt_clone/core/utils/validators/app_validator.dart';
import 'package:tt_clone/features/account_setup/views/screens/country_picker_screen.dart';
import 'package:tt_clone/routes/app_routes.dart';
import 'package:tt_clone/core/services/network_caller.dart';
import 'package:tt_clone/core/models/response_data.dart';

class LoginController extends GetxController {
  final emailTEController = TextEditingController();
  final passwordTEController = TextEditingController();
  var isPasswordHidden = true.obs;
  var rememberMe = false.obs;
  String? fcmToken;

  final NetworkCaller _networkCaller = NetworkCaller();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  @override
  void onInit() {
    super.onInit();
    _loadRememberedCredentials();
  }

  Future<void> _loadRememberedCredentials() async {
    final savedEmail = await AuthService.rememberedEmail;
    final savedPassword = await AuthService.rememberedPassword;

    if (savedEmail != null && savedPassword != null) {
      emailTEController.text = savedEmail;
      passwordTEController.text = savedPassword;
      rememberMe.value = true;
    }
  }

  /// 👇 Login method with API call
  Future<bool> login() async {
    // ✅ Validation using AppValidator
    final emailError = AppValidator.validateEmail(emailTEController.text);
    final passwordError = AppValidator.validatePassword(
      passwordTEController.text,
    );

    if (emailError != null) {
      AppSnackBar.showError(emailError);
      return false;
    }
    if (passwordError != null) {
      AppSnackBar.showError(passwordError);
      return false;
    }

    EasyLoading.show(status: "Logging in...");

    final Map<String, dynamic> requestBody = {
      "email": emailTEController.text.trim(),
      "password": passwordTEController.text.trim(),
      "fcmToken": fcmToken,
    };

    try {
      log("Login Request: $requestBody");

      final ResponseData response = await _networkCaller.postRequest(
        ApiConstants.login,
        body: requestBody,
      );

      EasyLoading.dismiss();

      if (!response.isSuccess) {
        AppSnackBar.showError(response.errorMessage);
        return false;
      }

      final responseData = response.responseData;
      final String message = responseData["message"] ?? "Login successful";
      final result = responseData["result"];

      final token = result["accessToken"];
      final userInfo = result["userInfo"];
      final userId = userInfo["id"];
      final isProfile = userInfo["isProfile"] ?? false;

      log("UserId: $userId, ProfileSetup: $isProfile");

      /// ✅ Save token & userId only (no role now)
      await AuthService.saveToken(token, userId, "USER"); // put dummy "USER"

      if (rememberMe.value) {
        await AuthService.saveCredentials(
          emailTEController.text,
          passwordTEController.text,
        );
      } else {
        await AuthService.clearCredentials();
      }

      EasyLoading.showSuccess(message);

      /// ✅ Navigate based on profile setup
      if (isProfile == false) {
        //Get.offAllNamed(AppRoute.profileSetupScreen);
        Get.to(() => const CountryPickerScreen());
      } else {
        Get.offAllNamed(AppRoute.navBar);
      }

      return true;
    } catch (e) {
      EasyLoading.dismiss();
      log("Login Error: $e");
      AppSnackBar.showError("An unexpected error occurred. Please try again.");
      return false;
    }
  }

  // ignore: unused_element
  void signInWithGoogle() {
    if (kDebugMode) {
      print("Signing in with Google");
    }
  }
}
