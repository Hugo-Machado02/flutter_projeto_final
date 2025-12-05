import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 1.obs;

  void changeTab(int index) {
    currentIndex.value = index;

    switch (index) {
      case 0:
        Get.offAllNamed('/usuarios');
        break;
      case 1:
        Get.offAllNamed('/home');
        break;
      case 2:
        Get.offAllNamed('/favoritos');
        break;
    }
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
