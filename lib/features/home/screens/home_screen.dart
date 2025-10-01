// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tt_clone/core/utils/constants/colors.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isTablet = MediaQuery.of(context).size.width > 600;

//     return Scaffold(
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: AppColors.white,
//         leading: Padding(
//           padding: EdgeInsets.only(left: isTablet ? 40.w : 24.w),
//           child: Image.asset(Assetpath.logo, height: 32.h, width: 32.w),
//         ),
//         title: Text(
//           "Vlogs Talk",
//           style: TextStyle(
//             fontSize: isTablet ? 28.sp : 24.sp,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(left: 16.w),
//             child: GestureDetector(
//               onTap: () => Get.to(() => SearchAccount()),
//               child: Image.asset(Assetpath.love, height: 32.h, width: 32.w),
//             ),
//           ),
//           SizedBox(width: 16.w),
//           GestureDetector(
//             onTap: () => Get.to(() => MessageInbox()),
//             child: Padding(
//               padding: EdgeInsets.only(right: 16.w),
//               child: Image.asset(Assetpath.chat, height: 32.h, width: 32.w),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: isTablet ? 40.w : 24.w),
//             child: InkWell(
//               onTap: () => Get.to(() => Notifications()),
//               child: Image.asset(
//                 Assetpath.notification,
//                 height: 32.h,
//                 width: 32.w,
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: AppColors.white,
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: isTablet ? 64.w : 24.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: isTablet ? 140.h : 104.h,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         GestureDetector(
//                           onTap: () => Get.to(() => ViewStory()),
//                           child: Stroy(image: Assetpath.ellipse, name: "You"),
//                         ),
//                         Stroy(image: Assetpath.juliya, name: "Juliya"),
//                         Stroy(image: Assetpath.andrew, name: "Andrew"),
//                         Stroy(image: Assetpath.jenny, name: "Jenny"),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: isTablet ? 32.h : 20.h),
//                   ListView.builder(
//                     itemCount: 6,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final posts = [
//                         {
//                           "dp": "assets/images/dp_one.png",
//                           "name": "anny_wilson",
//                           "position": "Marketing Coordinator",
//                           "image": "assets/images/Rectangle.png",
//                         },
//                         {
//                           "dp": "assets/images/dp_two.png",
//                           "name": "anny_wilson",
//                           "position": "Web Designer",
//                           "image": "assets/images/image_two.png",
//                         },
//                         {
//                           "dp": "assets/images/dp_three.png",
//                           "name": "anny_wilson",
//                           "position": "President of Sales",
//                           "image": "assets/images/image_three.png",
//                         },
//                         {
//                           "dp": "assets/images/dp_one.png",
//                           "name": "anny_wilson",
//                           "position": "Marketing Coordinator",
//                           "image": "assets/images/Rectangle.png",
//                         },
//                         {
//                           "dp": "assets/images/dp_two.png",
//                           "name": "anny_wilson",
//                           "position": "Web Designer",
//                           "image": "assets/images/image_two.png",
//                         },
//                         {
//                           "dp": "assets/images/dp_three.png",
//                           "name": "anny_wilson",
//                           "position": "President of Sales",
//                           "image": "assets/images/tiger.jpeg",
//                         },
//                       ];

//                       final post = posts[index];

//                       return PostCard(
//                         dp: post['dp']!,
//                         name: post['name']!,
//                         position: post['position']!,
//                         image: post['image']!,
//                         react: "900",
//                         comments: "202",
//                       );
//                     },
//                   ),
//                   SizedBox(height: 40.h), // add padding at bottom for spacing
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
