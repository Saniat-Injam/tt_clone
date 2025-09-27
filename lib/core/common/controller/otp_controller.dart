// import 'dart:async';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:tt_clone/core/common/presentation/widgets/app_snack_bar.dart';
// import 'package:tt_clone/core/services/auth_service.dart';
// import 'package:tt_clone/core/services/network_caller.dart';
// import 'package:tt_clone/core/utils/constants/api_constants.dart';
// import 'package:tt_clone/routes/app_routes.dart';

// class OtpController extends GetxController {
//   var secondsRemaining = 120.obs; // 2 min
//   var isVerifying = false.obs;
//   Timer? _timer;

//   String email = '';
//   String otpCode = '';

//   @override
//   void onInit() {
//     super.onInit();
//     startTimer();
//   }

//   void startTimer() {
//     secondsRemaining.value = 120;
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (secondsRemaining.value > 0) {
//         secondsRemaining.value--;
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   String get timerText {
//     final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(1, '0');
//     final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');
//     return "$minutes:$seconds";
//   }

//   /// Set OTP code from Pinput
//   void setOtp(String value) {
//     otpCode = value;
//   }

//   /// Verify OTP API
//   Future<void> verifyOtp({
//     required String email,
//     required String token,
//     required String reason,
//     required isSignUp,
//   }) async {
//     if (otpCode.isEmpty || otpCode.length != 6) {
//       Get.snackbar(
//         "Error",
//         "Please enter a valid 6-digit OTP",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }

//     isVerifying.value = true;

//     //final body = {"otp": otpCode, "reason": "SIGNUP_OTP_SECRET"};
//     final Map<String, dynamic> requestBody = {
//       "email": email,
//       "reason": reason,
//       "otp": code,
//     };

//     final response = await NetworkCaller().postRequest(
//       ApiConstants.verifyOtp,
//       body: requestBody,
//       token: token
//     );

//     isVerifying.value = false;
//      if (response.statusCode == 404) {
//         EasyLoading.dismiss();
//         AppSnackBar.showError("Wrong OTP");
//         return;
//       }

//       // Save token in AuthenticationService
//       await AuthService.saveToken(token, '', ''); // userId & role if available

//       // Navigate to login screen or main app
//       if (!isProfileComplete) {
//         Get.offAllNamed(AppRoute.login); // Or profile setup page
//       } else {
//         Get.offAllNamed(AppRoute.home); // Main app
//       }

//       Get.snackbar(
//         "Success",
//         "OTP verified successfully",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } else {
//       Get.snackbar(
//         "Error",
//         response.errorMessage,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   @override
//   void onClose() {
//     _timer?.cancel();
//     super.onClose();
//   }
// }
