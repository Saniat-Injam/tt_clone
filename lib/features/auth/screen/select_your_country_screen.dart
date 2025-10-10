import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_clone/features/account_setup/controller/select_your_country_controller.dart';
import 'package:tt_clone/features/account_setup/screens/profile_setting_screen.dart';

class SelectYourCountryScreen extends StatelessWidget {
  SelectYourCountryScreen({super.key});
  final SelectYourCountryController controller = Get.put(
    SelectYourCountryController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Select Your Country",
          style: GoogleFonts.urbanist(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: TextFormField(
                onChanged: controller.updateSearch,
                style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey.shade600),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.urbanist(
                    color: Colors.grey.shade500,
                    fontSize: 16.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Country list
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = controller.filteredCountries[index];

                    return Obx(() {
                      final isSelected = controller.isSelected(
                        country['name']!,
                      );

                      return InkWell(
                        onTap: () {
                          controller.countryToggle(country['name']!);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          height: 88.h,
                          width: 380.w,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF2FB3B3)
                                  : Color(0xFFD9D9D9),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      country['flag']!,
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                    SizedBox(width: 16.w),
                                    Text(
                                      country['name']!,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF2FB3B3),
                                      width: 2,
                                    ),
                                  ),
                                  child: isSelected
                                      ? Center(
                                          child: Container(
                                            width: 10.w,
                                            height: 10.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF2FB3B3),
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ),

            // Continue button
            // Container(
            //   height: 55.h,
            //   decoration: BoxDecoration(
            //     color: const Color(0xFF2FB3B3),
            //     borderRadius: BorderRadius.all(Radius.circular(16.r)),
            //   ),
            //   margin: EdgeInsets.only(bottom: 30),
            //   child: Center(
            //     child: Text(
            //       "Continue",
            //       style: GoogleFonts.urbanist(
            //         textStyle: const TextStyle(color: Colors.white),
            //         fontSize: 16,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),

      bottomNavigationBar: InkWell(
        onTap: () => Get.to(() => ProfileSettingScreen()),
        child: Container(
          height: 55.h,
          margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 60.h),
          decoration: BoxDecoration(
            color: const Color(0xFF2FB3B3),
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
          child: Center(
            child: Text(
              "Continue",
              style: GoogleFonts.urbanist(
                textStyle: const TextStyle(color: Colors.white),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
