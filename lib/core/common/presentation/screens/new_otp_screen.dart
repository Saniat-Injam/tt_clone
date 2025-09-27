// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt_clone/core/common/controller/new_otp_controller.dart';
// import 'package:tt_clone/core/common/presentation/widgets/app_snack_bar.dart';
// import 'package:tt_clone/core/common/presentation/widgets/custom_appbar_widget.dart';
// import 'package:tt_clone/core/common/presentation/widgets/custom_elevated_button_widget.dart';
// import 'package:tt_clone/core/common/presentation/widgets/custom_text.dart';
// import 'package:tt_clone/core/utils/constants/app_sizes.dart';
// import 'package:tt_clone/core/utils/constants/colors.dart';
// import 'package:tt_clone/features/auth/widget/custom_footer_section_widget.dart';
// import 'package:tt_clone/features/auth/widget/custom_otp_text_form_field_widget.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   final RxInt remainingTime = 120.obs;
//   late Timer timer;
//   final RxBool enableResendCodeButton = false.obs;

//   void startResendCodeTimer() {
//     enableResendCodeButton.value = false;
//     remainingTime.value = 120;
//     timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       remainingTime.value--;
//       if (remainingTime.value == 0) {
//         t.cancel();
//         enableResendCodeButton.value = true;
//       }
//     });
//   }

//   @override
//   void initState() {
//     startResendCodeTimer();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final arguments = Get.arguments ?? {};
//     final bool? isSignUp = arguments['isSignUp'];
//     final String? email = arguments['email'];
//     final String? token = arguments['token'];
//     //final controller = Get.find<ForgotOtpController>();
//     final OtpController otpController = Get.put(OtpController());
//     debugPrint(
//       "----------------------------------------------------------$email----------------------------------------------",
//     );
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(left: getWidth(16), right: getWidth(16)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomAppBarWidget(
//               onTap: () {
//                 Get.back();
//               },
//             ),

//             CustomText(
//               text: "Enter OTP",
//               fontSize: getWidth(21),
//               fontWeight: FontWeight.w600,
//             ),
//             SizedBox(height: getHeight(6)),
//             CustomText(
//               text: "Enter OTP send your number",
//               fontSize: getWidth(14),
//               fontWeight: FontWeight.w400,
//               color: AppColors.textGrey,
//             ),
//             SizedBox(height: getHeight(32)),
//             CustomOTPTextFormFieldWidget(
//               controller: otpController.otpTEController,
//               fontSize: getWidth(20),
//               activeFillColor: Colors.white,
//               inactiveFillColor: Color(0xffFAFAFA),
//               pinCount: 6,
//             ),
//             SizedBox(height: getHeight(20)),

//             CustomFooterSection(
//               titleText: "Didn’t receive the code? ",
//               buttonTitle: "Resend code",
//               onTap: () {
//                 if (enableResendCodeButton.value == true) {
//                   startResendCodeTimer();
//                   if (isSignUp == true) {
//                     otpController.resendOtp(
//                       email: email.toString(),
//                       reason: "SIGNUP_OTP_SECRET",
//                     );
//                   } else {
//                     otpController.resendOtp(
//                       email: email.toString(),
//                       reason: "FORGET_PASSWORD_SECRET",
//                     );
//                   }
//                 } else {
//                   AppSnackBar.showError("Please wait for timer finish");
//                 }
//               },
//             ),
//             buildCustomTimeAndSendAgainWidget(
//               resendText: 'Resend code in',
//               buttonName: "Send Again",
//             ),
//             Spacer(),
//             CustomElevatedButtonWidget(
//               buttonTitle: "Continue",
//               onPressed: () {
//                 if (isSignUp == true) {
//                   otpController.verifyOtp(
//                     email: email.toString(),
//                     reason: "SIGNUP_OTP_SECRET",
//                     token: token!,
//                     isSignUp: isSignUp,
//                   );
//                 } else {
//                   otpController.verifyOtp(
//                     email: email.toString(),
//                     reason: "FORGET_PASSWORD_SECRET",
//                     token: token!,
//                     isSignUp: isSignUp,
//                   );
//                 }
//               },
//             ),
//             SizedBox(height: getHeight(40)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCustomTimeAndSendAgainWidget({
//     required String resendText,
//     required String buttonName,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Obx(
//           () => RichText(
//             text: TextSpan(
//               style: TextStyle(
//                 color: Color(0xff374151),
//                 fontSize: getWidth(15),
//                 fontWeight: FontWeight.w500,
//               ),
//               text: "$resendText ",
//               children: [
//                 TextSpan(
//                   text: "${remainingTime.value}s",
//                   style: TextStyle(
//                     color: AppColors.primary,
//                     fontSize: getWidth(15),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt_clone/core/common/controller/new_otp_controller.dart';
import 'package:tt_clone/core/common/presentation/widgets/app_snack_bar.dart';
import 'package:tt_clone/core/common/presentation/widgets/custom_appbar_widget.dart';
import 'package:tt_clone/core/common/presentation/widgets/custom_elevated_button_widget.dart';
import 'package:tt_clone/core/common/presentation/widgets/custom_text.dart';
import 'package:tt_clone/core/utils/constants/colors.dart';
import 'package:tt_clone/features/auth/widget/custom_footer_section_widget.dart';
import 'package:tt_clone/features/auth/widget/custom_otp_text_form_field_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final RxInt remainingTime = 120.obs;
  late Timer timer;
  final RxBool enableResendCodeButton = false.obs;

  void startResendCodeTimer() {
    enableResendCodeButton.value = false;
    remainingTime.value = 120;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      remainingTime.value--;
      if (remainingTime.value == 0) {
        t.cancel();
        enableResendCodeButton.value = true;
      }
    });
  }

  @override
  void initState() {
    startResendCodeTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments ?? {};
    final bool? isSignUp = arguments['isSignUp'];
    final String? email = arguments['email'];
    final String? token = arguments['token'];

    final OtpController otpController = Get.put(OtpController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBarWidget(onTap: () => Get.back()),

            CustomText(
              text: "Enter OTP",
              fontSize: 21.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6.h),
            CustomText(
              text: "Enter OTP sent to your number",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
            SizedBox(height: 32.h),

            CustomOTPTextFormFieldWidget(
              controller: otpController.otpTEController,
              fontSize: 20.sp,
              activeFillColor: Colors.white,
              inactiveFillColor: const Color(0xffFAFAFA),
              pinCount: 6,
            ),
            SizedBox(height: 20.h),

            CustomFooterSection(
              titleText: "Didn’t receive the code? ",
              buttonTitle: "Resend code",
              onTap: () {
                if (enableResendCodeButton.value == true) {
                  startResendCodeTimer();
                  if (isSignUp == true) {
                    otpController.resendOtp(
                      email: email.toString(),
                      reason: "SIGNUP_OTP_SECRET",
                    );
                  } else {
                    otpController.resendOtp(
                      email: email.toString(),
                      reason: "FORGET_PASSWORD_SECRET",
                    );
                  }
                } else {
                  AppSnackBar.showError("Please wait for the timer to finish");
                }
              },
            ),

            buildCustomTimeAndSendAgainWidget(
              resendText: 'Resend code in',
              buttonName: "Send Again",
            ),

            const Spacer(),

            CustomElevatedButtonWidget(
              buttonTitle: "Continue",
              onPressed: () {
                if (isSignUp == true) {
                  otpController.verifyOtp(
                    email: email.toString(),
                    reason: "SIGNUP_OTP_SECRET",
                    token: token!,
                    isSignUp: isSignUp,
                  );
                } else {
                  otpController.verifyOtp(
                    email: email.toString(),
                    reason: "FORGET_PASSWORD_SECRET",
                    token: token!,
                    isSignUp: isSignUp,
                  );
                }
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget buildCustomTimeAndSendAgainWidget({
    required String resendText,
    required String buttonName,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => RichText(
            text: TextSpan(
              style: TextStyle(
                color: const Color(0xff374151),
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              text: "$resendText ",
              children: [
                TextSpan(
                  text: "${remainingTime.value}s",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
