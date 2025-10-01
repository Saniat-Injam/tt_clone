import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxDouble fabAngle = 0.0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void toggleFabRotation() {
    fabAngle.value = fabAngle.value == 0 ? 0.7854 : 0;
  }
}
