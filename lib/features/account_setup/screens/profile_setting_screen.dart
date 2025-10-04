import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_clone/core/common/presentation/widgets/custom_text_form_field.dart';
import 'package:tt_clone/core/utils/constants/image_path.dart';
import 'package:tt_clone/features/account_setup/controller/country_controller.dart';
import 'package:tt_clone/features/account_setup/controller/profile_setting_controller.dart';
import 'package:tt_clone/features/auth/screen/follow_someone_screen.dart';

class ProfileSettingScreen extends StatelessWidget {
  ProfileSettingScreen({super.key});
  final ProfileSettingController profileSettingController = Get.put(
    ProfileSettingController(),
  );
  final CountryController countryController = Get.put(CountryController());

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,

        title: Text(
          "Fill Your Profile",
          style: GoogleFonts.urbanist(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Obx(
                    () => CircleAvatar(
                      radius: 70.r,
                      backgroundImage:
                          profileSettingController.pickedImage.value != null
                          ? FileImage(
                              profileSettingController.pickedImage.value!,
                            )
                          : AssetImage(Assetpath.profile) as ImageProvider,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 90.0, top: 110),
                  child: GestureDetector(
                    onTap: () => profileSettingController.pickImage(),
                    child: Image.asset(
                      Assetpath.profileup,
                      height: 29.h,
                      width: 29.w,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomTextFormField(
                hintText: "Full Name",
                fillColor: Color(0xFFF5F5F5),
                //readOnly: true,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomTextFormField(
                hintText: "User Name",
                fillColor: Color(0xFFF5F5F5),
                //readOnly: true,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => CustomTextFormField(
                  hintText: profileSettingController.selectedDate.isEmpty
                      ? "Date Of Birth"
                      : profileSettingController.selectedDate.value,
                  fillColor: const Color(0xFFF5F5F5),
                  myImage: Assetpath.fpcalendar,
                  readOnly: true,
                  onTap: () => profileSettingController.pickDate(context),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomTextFormField(
                hintText: "Email",
                fillColor: Color(0xFFF5F5F5),
                myImage: Assetpath.fpemail,
                readOnly: true,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  children: [
                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: countryController.selectedFlag.value,
                          items: countryController.countries.map((country) {
                            return DropdownMenuItem<String>(
                              value: country['flag'],
                              child: Text(
                                "${country['flag']}",
                                style: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              countryController.updateCountry(value);
                            }
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Phone Number",
                        fillColor: Color(0xFFF5F5F5),
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomTextFormField(
                hintText: "Occupaion",
                fillColor: Color(0xFFF5F5F5),
                readOnly: true,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: InkWell(
        onTap: () => Get.to(() => FollowSomeone()),
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
