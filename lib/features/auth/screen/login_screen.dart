import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tt_clone/core/common/presentation/widgets/custom_text_form_field.dart';

import 'package:tt_clone/core/utils/constants/colors.dart';
import 'package:tt_clone/features/auth/controller/login_controller.dart';
import 'package:tt_clone/features/auth/screen/sign_up_screen.dart';
import 'package:tt_clone/features/home/screens/navbar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, scrolledUnderElevation: 0),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.25.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login to your \naccount",
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  // ** Email Input ** (UPDATED with controller)
                  SizedBox(height: 50.25.h),
                  CustomTextFormField(
                    controller: loginController.emailTEController, // 👈 Added
                    hintText: "john.doe@domain.com",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w600,
                    ),
                    inputType: TextInputType.emailAddress,
                    max: 1,
                    min: 1,
                    obscureText: false,
                    preffix: Icon(Icons.email_outlined),
                  ),

                  // ** Password Input ** (UPDATED with controller)
                  SizedBox(height: 20.h),
                  Obx(
                    () => CustomTextFormField(
                      controller:
                          loginController.passwordTEController, // 👈 Added
                      hintText: "●●●●●●●●●●●●",
                      hintStyle: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.hintText,
                        fontWeight: FontWeight.w600,
                      ),
                      inputType: TextInputType.text,
                      max: 1,
                      min: 1,
                      obscureText: loginController.isPasswordHidden.value,
                      preffix: Icon(Icons.lock),
                      suffix: GestureDetector(
                        onTap: loginController.togglePasswordVisibility,
                        child: Icon(
                          loginController.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  // ** Remember me Checkbox **
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: loginController.rememberMe.value,
                            onChanged: (bool? value) {
                              loginController.toggleRememberMe();
                            },
                            activeColor: AppColors.buttonBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // ** Sign In Button **
                  SizedBox(
                    height: 56.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.buttonText,
                        ),
                      ),
                    ),
                  ),

                  // Forgot password + rest of your UI unchanged...
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () {
                      //Get.off(ForgottenPassword());
                    },
                    child: Text(
                      "Forgot the Password",
                      style: TextStyle(
                        color: AppColors.buttonBackground,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 54.75.h),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xffBFBFBF))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.orText,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Color(0xffBFBFBF))),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 18.h,
                        horizontal: 32.w,
                      ),
                      side: BorderSide(color: Colors.grey),
                      backgroundColor: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/images/google.png",
                      height: 23.h,
                      width: 24.w,
                    ),
                  ),

                  SizedBox(height: 50.25.h),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: AppColors.orText,
                        fontSize: 14.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.progress,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(SignUpScreen()),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 48.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
