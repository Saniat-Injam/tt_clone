// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tt_clone/features/home/controller/home_controller.dart';

// class NavBarScreens extends StatelessWidget {
//   NavBarScreens({super.key});

//   final HomeController homeController = Get.put(HomeController());

//   final List<Widget> _pages = [
//     HomeScreen(),
//     //Search(),
//     //Search(),
//     //Sorts(),
//     //LightProfile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Stack(
//         children: [
//           Scaffold(
//             body: _pages[homeController.selectedIndex.value],
//             bottomNavigationBar: CustomBottomNavigationBar(
//               currentIndex: homeController.selectedIndex.value,
//               onTap: homeController.changeTab,
//             ),
//           ),
//           Positioned(
//             bottom: 15,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: SizedBox(
//                 height: 40.h,
//                 width: 40.w,
//                 child: FloatingActionButton(
//                   onPressed: () {
//                     homeController.toggleFabRotation();
//                     Get.dialog(
//                       Dialog(
//                         backgroundColor: Colors.transparent,
//                         insetPadding: EdgeInsets.all(20.r),
//                         child: CustomPopup(),
//                       ),
//                     ).then((_) {
//                       // Optional: Reset on dialog close
//                       homeController.toggleFabRotation();
//                     });
//                   },
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.r),
//                   ),
//                   elevation: 0,
//                   child: Obx(
//                     () => AnimatedRotation(
//                       duration: Duration(milliseconds: 300),
//                       turns: homeController.fabAngle.value / (2 * 3.1416),
//                       child: Icon(Icons.add, color: Colors.white, size: 24.sp),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("Hello Nav Bar Screen"))),
    );
  }
}
