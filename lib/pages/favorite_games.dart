import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/games_controller.dart';
import 'package:projeto_final/controllers/navigation_controller.dart';
import 'package:projeto_final/shared/custom_app_bar.dart';
import 'package:projeto_final/shared/custom_menu.dart';
import 'package:projeto_final/pages/list_games.dart';

class FavoriteGames extends StatelessWidget {
  const FavoriteGames({super.key});

  @override
  Widget build(BuildContext context) {
    final GamesController gamesController = Get.find<GamesController>();
    final NavigationController navController = Get.find<NavigationController>();

    navController.setCurrentIndex(2);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Color(0xFF101013),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8162FF), Color(0xFF9575FF)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8162FF).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Meus Favoritos',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Seus jogos preferidos',
                          style: TextStyle(fontSize: 14, color: Colors.white60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                final favoriteGames = gamesController.favoriteGames;

                if (favoriteGames.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: 48,
                            color: Colors.white38,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Nenhum jogo favoritado',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: favoriteGames.length,
                  itemBuilder: (context, index) {
                    final game = favoriteGames[index];

                    return ItemGameReactive(
                      game: game,
                      isFavorite: true,
                      onToggle: () => gamesController.toggleFavorite(game),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomMenu(),
    );
  }
}
