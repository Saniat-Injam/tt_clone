import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt_clone/core/utils/constants/colors.dart';
import 'package:tt_clone/core/utils/constants/image_path.dart';
import 'package:gradient_borders/gradient_borders.dart'; // Add this import

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 53.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Image.asset(Assetpath.fotgotten),
                  ),

                  SizedBox(height: 53.h),

                  Text(
                    "Select which contact details should we use to reset your password",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff595959),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20.h),

                  // SMS Option
                  Container(
                    width: double.infinity,
                    height: 128.h,
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: const LinearGradient(
                          colors: [Color(0xff92FFFF), Color(0xff2FB3B3)],
                        ),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        children: [
                          Image.asset(
                            Assetpath.autoLayout,
                            width: 80.w,
                            height: 80.h,
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "via SMS:",
                                  style: TextStyle(
                                    color: const Color(0xff8C8C8C),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  "+6282******39",
                                  style: TextStyle(
                                    color: const Color(0xff262626),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Email Option
                  Container(
                    width: double.infinity,
                    height: 128.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffD9D9D9),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        children: [
                          Image.asset(
                            Assetpath.autoLayoutTwo,
                            width: 80.w,
                            height: 80.h,
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "via Email:",
                                  style: TextStyle(
                                    color: const Color(0xff8C8C8C),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  "ex***le@yourdomain.com",
                                  style: TextStyle(
                                    color: const Color(0xff262626),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 53.h),

                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.buttonText,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
