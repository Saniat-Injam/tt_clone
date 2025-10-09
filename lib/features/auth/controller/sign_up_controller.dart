import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tt_clone/core/common/presentation/screens/new_otp_screen.dart';
import 'package:tt_clone/core/common/presentation/widgets/app_snack_bar.dart';

import 'package:tt_clone/core/services/auth_service.dart';
import 'package:tt_clone/core/services/network_caller.dart';
import 'package:tt_clone/core/utils/constants/api_constants.dart';
import 'package:tt_clone/core/utils/logging/logger.dart';

class SignUpController extends GetxController {
  var isPasswordHidden = true.obs;
  var rememberMe = false.obs;
  // var isLoading = false.obs;

  // Text Controllers
  final usernameTEController = TextEditingController();
  final emailTEController = TextEditingController();
  final passwordTEController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> registerUser() async {
    final userName = usernameTEController.text.trim();
    final email = emailTEController.text.trim();
    final password = passwordTEController.text.trim();

    if (userName.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    // isLoading.value = true;
    final Map<String, dynamic> requestBody = {
      "userName": userName,
      "email": email,
      "password": password,
    };
    final response = await NetworkCaller().postRequest(
      ApiConstants.createAccount,
      //body: {"userName": userName, "email": email, "password": password},
      body: requestBody,
    );

    debugPrint("-------------${response.statusCode}---------------------");
    final String message = response.responseData['message'];
    debugPrint("-------------------$message-----------------------------");
    AppLoggerHelper.error('Error: $message');
    //isLoading.value = false;

    if (response.statusCode == 409) {
      EasyLoading.dismiss();
      AppSnackBar.showError("User Already exists");
      return;
    }

    // *** Example server response *** ======================================
    //    {
    //      "success": true,
    //       "message": "Account created successfully",
    //       "result": {
    //         "token": "abc123"
    //       }
    //    }

    // *** NetworkCaller will convert it to *** ==============================
    // ResponseData(
    //   isSuccess: true,
    //   statusCode: 200,
    //   errorMessage: "",
    //   responseData: {
    //     "success": true,
    //     "message": "Account created successfully",
    //     "result": {"token": "abc123"}
    //   }
    // )

    if (response.isSuccess) {
      final token = response.responseData?["result"]["token"];
      EasyLoading.showSuccess(message);

      if (token != null) {
        await AuthService.saveToken(token, "", "");
      }

      // 🔹 Save credentials locally only if rememberMe is true
      if (rememberMe.value) {
        await AuthService.saveCredentials(email, password);
      } else {
        await AuthService.clearCredentials();
      }

      Get.to(
        () => OtpScreen(),
        arguments: {
          "isSignUp": true,
          'email': emailTEController.text,
          'token': token,
        },
      );
      // Get.toNamed(
      //   AppRoute.OtpScreen,
      //   arguments: {
      //     "isSignUp": true,
      //     'email': emailTEController.text,
      //     'token': token,
      //   },
      // );

      Get.snackbar(
        "Success",
        response.responseData?["message"] ?? "Registered successfully",
      );

      // Navigate to OTP screen
      //Get.to(() => OtpScreen(email: email));
    } else {
      Get.snackbar("Error", response.errorMessage);
      log("Registration failed: ${response.errorMessage}");
    }
  }

  @override
  void onClose() {
    usernameTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}
