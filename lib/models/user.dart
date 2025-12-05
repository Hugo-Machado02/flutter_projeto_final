import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    List<int>? favoriteGameIds,
  }) : favoriteGameIds = favoriteGameIds ?? [];

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String username;

  @HiveField(3)
  String password;

  @HiveField(4)
  List<int> favoriteGameIds;

  // Adicionar jogo aos favoritos
  void addFavoriteGame(int gameId) {
    if (!favoriteGameIds.contains(gameId)) {
      favoriteGameIds.add(gameId);
    }
  }

  // Remover jogo dos favoritos
  void removeFavoriteGame(int gameId) {
    favoriteGameIds.remove(gameId);
  }

  // Verificar se jogo está nos favoritos
  bool isFavorite(int gameId) {
    return favoriteGameIds.contains(gameId);
  }
}
