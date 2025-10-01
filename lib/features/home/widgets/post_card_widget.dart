// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tt_clone/core/utils/constants/colors.dart';

// class PostCard extends StatelessWidget {
//   final String dp;
//   final String name;
//   final String position;
//   final String image;
//   final String? heart;
//   final String? react;
//   final String? comment;
//   final String? comments;
//   final String? share;
//   final String? save;

//   const PostCard({
//     super.key,
//     required this.dp,
//     required this.name,
//     required this.position,
//     required this.image,
//     this.heart,
//     this.react,
//     this.comment,
//     this.comments,
//     this.share,
//     this.save,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.white,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(dp, height: 48.h, width: 48.w),
//                   SizedBox(width: 16.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name,
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.black,
//                         ),
//                       ),
//                       Text(
//                         position,
//                         style: TextStyle(
//                           color: AppColors.orText,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) => InfoBottomSheet(),
//                   );
//                 },
//                 child: Image.asset(
//                   Assetpath.more,
//                   height: 21.58.h,
//                   width: 21.58.h,
//                   color: AppColors.hintText,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16.h),
//           Container(
//             width: 380.w,
//             height: 380.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.r),
//             ),
//             child: AssetImageCarouselSlider(
//               imageHeight: 360.h,
//               dotColor: AppColors.buttonBackground,
//               items: [image, image, image, image, image],
//             ),
//           ),
//           Row(
//             children: [
//               SizedBox(width: 12.w),
//               Image.asset(Assetpath.love, height: 28.h, width: 28.w),
//               SizedBox(width: 8.w),
//               Text(
//                 react ?? "00",
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.hintText,
//                 ),
//               ),
//               SizedBox(width: 24.w),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(Comment());
//                 },
//                 child: Image.asset(Assetpath.chat, height: 28.h, width: 28.w),
//               ),
//               SizedBox(width: 8.w),
//               Text(
//                 comments ?? "00",
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//               ),

//               SizedBox(width: 24.w),
//               // share button add
//               SizedBox(width: 24.w),
//               Spacer(),
//               GestureDetector(
//                 onTap: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) => ShortsCommenBottomSheet(),
//                   );
//                 },
//                 child: Image.asset(Assetpath.save, height: 29.h, width: 28.w),
//               ),
//             ],
//           ),
//           SizedBox(height: 24.h),
//         ],
//       ),
//     );
//   }
// }
