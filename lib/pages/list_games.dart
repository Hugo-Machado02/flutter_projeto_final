import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/games_controller.dart';
import 'package:projeto_final/controllers/navigation_controller.dart';
import 'package:projeto_final/shared/custom_app_bar.dart';
import 'package:projeto_final/shared/custom_menu.dart';

class ListGames extends StatelessWidget {
  const ListGames({super.key});

  @override
  Widget build(BuildContext context) {
    final GamesController gamesController = Get.find<GamesController>();
    final NavigationController navController = Get.find<NavigationController>();

    navController.setCurrentIndex(1);

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
                      Icons.games,
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
                          'Catálogo de Jogos',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Descubra novos jogos incríveis',
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
                final filteredGames = gamesController.filteredGames;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: filteredGames.length,
                  itemBuilder: (context, index) {
                    final game = filteredGames[index];
                    final isFav = gamesController.isFavorite(game);

                    return ItemGameReactive(
                      game: game,
                      isFavorite: isFav,
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

class ItemGameReactive extends StatelessWidget {
  final game;
  final bool isFavorite;
  final VoidCallback onToggle;

  const ItemGameReactive({
    super.key,
    required this.game,
    required this.isFavorite,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF1A1B1F), const Color(0xFF141518)],
        ),
        border: Border.all(color: const Color(0xFF26272B), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        game.urlImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF26272B),
                            child: const Icon(
                              Icons.games,
                              color: Color(0xFF8162FF),
                              size: 48,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  height: 44,
                  child: Text(
                    game.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isFavorite
                          ? [Colors.red, Colors.redAccent]
                          : [const Color(0xFF8162FF), const Color(0xFF9575FF)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            (isFavorite ? Colors.red : const Color(0xFF8162FF))
                                .withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: onToggle,
                      child: Center(
                        child: Text(
                          isFavorite ? 'Remover' : 'Favoritar',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
