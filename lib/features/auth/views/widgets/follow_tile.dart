import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool isFollow;
  final VoidCallback onTap;
  const FollowTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isFollow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(image, height: 60.h, width: 60.w),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(title), Text(subtitle)],
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 32.h,
              width: isFollow ? 73.w : 92.w,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isFollow ? Color(0xFF2FB3B3) : Colors.white,
                border: Border.all(color: Color(0xFF2FB3B3), width: 1.5.w),
              ),
              child: Center(
                child: Text(
                  isFollow ? "Follow" : "Follownig",
                  style: GoogleFonts.urbanist(
                    color: isFollow ? Colors.white : Color(0xFF2FB3B3),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
