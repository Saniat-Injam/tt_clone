import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_clone/features/auth/controllers/follow_someone_controller.dart';
import 'package:tt_clone/features/auth/views/widgets/follow_tile.dart';

import 'package:tt_clone/features/home/screens/navbar.dart';

class FollowSomeone extends StatelessWidget {
  FollowSomeone({super.key});
  final FollowSomeoneController followSomeoneController = Get.put(
    FollowSomeoneController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Follow Someone",
          style: GoogleFonts.urbanist(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Text(
              "Follow someone you might know and you can skip them too",
              style: GoogleFonts.urbanist(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: TextFormField(
                onChanged: followSomeoneController.updateSearch,
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
            SizedBox(height: 20),

            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: followSomeoneController.filteredList.length,
                  itemBuilder: (context, index) {
                    var someone = followSomeoneController.filteredList[index];
                    return FollowTile(
                      image: someone['image'],
                      title: someone['title'],
                      subtitle: someone['subtitle'],
                      isFollow: someone['follow'],
                      onTap: () {
                        someone['follow'] = !someone['follow'];
                        followSomeoneController.filteredList.refresh();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => {Get.to(() => NavBar())},
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
