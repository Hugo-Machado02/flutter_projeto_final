import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/models/game.dart';
import 'package:projeto_final/controllers/auth_controller.dart';
import 'package:projeto_final/persistence/services/user_service.dart';
import 'package:projeto_final/services/games_api_service.dart';

class GamesController extends GetxController {
  var games = <Game>[].obs;
  var favoriteGames = <Game>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadGamesOnce();
    
    // Escutar mudanças no usuário logado apenas para favoritos
    ever(Get.find<AuthController>().currentUser, (_) => _updateFavoritesOnly());
  }
  
  Future<void> _loadGamesOnce() async {
    isLoading.value = true;
    try {
      final apiGames = await GamesApiService.fetchGames();
      games.value = apiGames;
      _updateFavoritesOnly();
    } catch (e) {
      _showSnackbar('Erro', 'Falha ao carregar jogos da API');
    } finally {
      isLoading.value = false;
    }
  }
  
  void _updateFavoritesOnly() {
    final authController = Get.find<AuthController>();
    if (authController.currentUser.value != null) {
      authController.reloadCurrentUser();
      final favoriteIds = authController.currentUser.value!.favoriteGameIds;
      favoriteGames.value = games.where((game) => favoriteIds.contains(game.id)).toList();
    } else {
      favoriteGames.clear();
    }
  }

  Future<void> toggleFavorite(Game game) async {
    final authController = Get.find<AuthController>();
    if (authController.currentUser.value == null) return;
    
    final userId = authController.currentUser.value!.id;
    
    if (isFavorite(game)) {
      await UserService.removeGameFromFavorites(userId, game.id);
    } else {
      await UserService.addGameToFavorites(userId, game.id);
    }
    
    _updateFavoritesOnly();
    update();
  }

  bool isFavorite(Game game) {
    final authController = Get.find<AuthController>();
    if (authController.currentUser.value == null) return false;
    return authController.currentUser.value!.favoriteGameIds.contains(game.id);
  }

  void _showSnackbar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: const Color(0xFF8162FF), colorText: Colors.white);
  }
}