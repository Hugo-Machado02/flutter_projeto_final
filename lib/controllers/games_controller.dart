import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/models/game.dart';

class GamesController extends GetxController {
  var games = <Game>[].obs;
  var favoriteGames = <Game>[].obs;
  var isLoading = false.obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadGames();
  }

  void loadGames() {
    games.value = [
      Game(
        id: 1,
        title: "God Of War",
        urlImage:
            "https://media.rawg.io/media/games/52b/52be96c19be0d79eeb8664e4ca2aabd5.jpg",
      ),
      Game(
        id: 2,
        title: "The Last of Us",
        urlImage:
            "https://media.rawg.io/media/games/6fc/6fcf4cd3b17c288821388e6085bb0fc9.jpg",
      ),
      Game(
        id: 3,
        title: "Red Dead Redemption 2",
        urlImage:
            "https://media.rawg.io/media/games/52b/52be96c19be0d79eeb8664e4ca2aabd5.jpg",
      ),
      Game(
        id: 4,
        title: "Cyberpunk 2077",
        urlImage:
            "https://media.rawg.io/media/games/6fc/6fcf4cd3b17c288821388e6085bb0fc9.jpg",
      ),
      Game(
        id: 5,
        title: "Elden Ring",
        urlImage:
            "https://media.rawg.io/media/games/b54/b54598d1d5cc31899f4f0a7e3122a7b0.jpg",
      ),
    ];
  }

  List<Game> get filteredGames {
    if (searchText.value.isEmpty) {
      return games.value;
    }
    return games.value
        .where(
          (game) =>
              game.title.toLowerCase().contains(searchText.value.toLowerCase()),
        )
        .toList();
  }

  void toggleFavorite(Game game) {
    if (isFavorite(game)) {
      favoriteGames.removeWhere((item) => item.id == game.id);
      Get.snackbar(
        'Favoritos',
        '${game.title} removido dos favoritos',
        backgroundColor: const Color(0xFF8162FF),
        colorText: Colors.white,
      );
    } else {
      favoriteGames.add(game);
      Get.snackbar(
        'Favoritos',
        '${game.title} adicionado aos favoritos',
        backgroundColor: const Color(0xFF8162FF),
        colorText: Colors.white,
      );
    }
  }

  bool isFavorite(Game game) {
    return favoriteGames.any((item) => item.id == game.id);
  }

  void searchGames(String query) {
    searchText.value = query;
  }
}
