// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';
// import 'package:tt_clone/core/common/controller/otp_controller.dart';
// import 'package:tt_clone/core/utils/constants/colors.dart';

// class OtpScreen extends StatelessWidget {
//   final OtpController otpController = Get.put(OtpController());
//   OtpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //otpController.email = email;
//     final arguments = Get.arguments ?? {};
//     final bool? isSignUp = arguments['isSignUp'];
//     final String? email = arguments['email'];
//     final String? token = arguments['token'];

//     final defaultPinTheme = PinTheme(
//       width: 78.w,
//       height: 61.h,
//       margin: EdgeInsets.symmetric(horizontal: 2.w),
//       textStyle: TextStyle(
//         color: AppColors.hintText,
//         fontWeight: FontWeight.w700,
//         fontSize: 24.sp,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.r),
//         color: AppColors.white.withOpacity(0.05),
//         border: Border.all(color: AppColors.hintText.withOpacity(0.2)),
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("OTP Verification", style: TextStyle(fontSize: 20.sp)),
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 80.h),
//               Text(
//                 "Code has been sent to $email",
//                 style: TextStyle(fontSize: 16.sp, color: Color(0xff595959)),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 40.h),

//               Pinput(
//                 length: 6,
//                 keyboardType: TextInputType.number,
//                 defaultPinTheme: defaultPinTheme,
//                 focusedPinTheme: defaultPinTheme,
//                 submittedPinTheme: defaultPinTheme,
//                 showCursor: true,
//                 onChanged: otpController.setOtp,
//               ),
//               SizedBox(height: 40.h),

//               Obx(() {
//                 return otpController.secondsRemaining.value > 0
//                     ? Text(
//                         "Resend code in ${otpController.timerText}",
//                         style: TextStyle(fontSize: 14.sp),
//                       )
//                     : TextButton(
//                         onPressed: otpController.startTimer,
//                         child: Text(
//                           "Resend Code",
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: AppColors.progress,
//                           ),
//                         ),
//                       );
//               }),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         top: false,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//           child: Obx(() {
//             return SizedBox(
//               height: 56.h,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: otpController.isVerifying.value
//                     ? null
//                     : otpController.verifyOtp,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.buttonBackground,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                 ),
//                 child: otpController.isVerifying.value
//                     ? CircularProgressIndicator(color: Colors.white)
//                     : Text(
//                         "Continue",
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           color: AppColors.buttonText,
//                         ),
//                       ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
