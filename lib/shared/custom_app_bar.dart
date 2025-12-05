import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/pages/perfil.dart';
import 'package:projeto_final/controllers/auth_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF141518),
      toolbarHeight: 80,
      elevation: 0,
      flexibleSpace: Container(color: Color(0xFF141518)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                final authController = Get.find<AuthController>();
                final userName = authController.currentUser.value?.name ?? 'Usuário';
                return Text(
                  'Olá, $userName!',
                  style: TextStyle(
                    fontSize: 22,
                    color: const Color(0xFF9575FF),
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              Text(
                'Seja Bem-vindo!',
                style: TextStyle(fontSize: 12, color: Colors.white60),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.settings, size: 25, color: Colors.white),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Perfil()),
              ),
            },
          ),
        ],
      ),
      shape: const Border(
        bottom: BorderSide(color: Color(0xFF26272B), width: 1.0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
