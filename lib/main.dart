import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/pages/list_games.dart';
import 'package:projeto_final/pages/favorite_games.dart';
import 'package:projeto_final/pages/list_users.dart';
import 'package:projeto_final/pages/login.dart';
import 'package:projeto_final/controllers/auth_controller.dart';
import 'package:projeto_final/controllers/games_controller.dart';
import 'package:projeto_final/controllers/navigation_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(GamesController());
    Get.put(NavigationController());

    return GetMaterialApp(
      title: 'Catálogo de Jogos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8162FF)),
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/home', page: () => const ListGames()),
        GetPage(name: '/usuarios', page: () => const ListUsers()),
        GetPage(name: '/favoritos', page: () => const FavoriteGames()),
      ],
    );
  }
}
