import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tt_clone/core/common/presentation/widgets/custom_text_form_field.dart';
import 'package:tt_clone/core/utils/constants/colors.dart';
import 'package:tt_clone/features/auth/controller/sign_up_controller.dart';
import 'package:tt_clone/features/auth/screen/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController registrationController = Get.put(SignUpController());
  SignUpScreen({super.key});

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
                  // ** Screen Title ** ========================================
                  SizedBox(height: 50.25.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create your \naccount",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  // ** Three Input Box (Username, email, password) ** ========================================
                  SizedBox(height: 50.25.h),
                  CustomTextFormField(
                    controller: registrationController.usernameTEController,
                    hintText: "Username",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w600,
                    ),
                    inputType: TextInputType.name,
                    max: 1,
                    min: 1,
                    obscureText: false,
                    preffix: Icon(Icons.person_4_rounded),
                  ),

                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: registrationController.emailTEController,
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

                  SizedBox(height: 20.h),
                  Obx(
                    () => CustomTextFormField(
                      controller: registrationController.passwordTEController,
                      hintText: "●●●●●●●●●●●●",
                      hintStyle: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.hintText,
                        fontWeight: FontWeight.w600,
                      ),
                      inputType: TextInputType.emailAddress,
                      max: 1,
                      min: 1,
                      obscureText:
                          registrationController.isPasswordHidden.value,
                      preffix: Icon(Icons.lock),
                      suffix: InkWell(
                        onTap: () {
                          registrationController.togglePasswordVisibility();
                        },
                        child: registrationController.isPasswordHidden.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  ),

                  // ** Check Box ** ========================================
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: registrationController.rememberMe.value,
                            onChanged: (bool? value) {
                              registrationController.toggleRememberMe();
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

                  // ** SignUp Button ** ========================================
                  SizedBox(
                    height: 56.h,
                    width: 380.w,
                    child: ElevatedButton(
                      onPressed: () {
                        registrationController.registerUser();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.buttonText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.25.h),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xffBFBFBF))),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 22.h,
                        ),
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

                  // ** Create Account Using Google ** ========================================
                  SizedBox(height: 20.h),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 18.w,
                        horizontal: 32.h,
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

                  // ** Already have account? ** ========================================
                  SizedBox(height: 50.25.h),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: AppColors.orText, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.progress,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(LoginScreen()),
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
