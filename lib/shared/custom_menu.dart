import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/navigation_controller.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find<NavigationController>();
    
    return Obx(() => BottomNavigationBar(
      backgroundColor: const Color(0xFF141518),
      selectedItemColor: const Color(0xFF8162FF),
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: navController.currentIndex.value,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Usuários'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
      ],
      onTap: navController.changeTab,
    ));
  }
}
