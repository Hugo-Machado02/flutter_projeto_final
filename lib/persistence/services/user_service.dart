import '../../models/user.dart';
import '../repositories/user_repository.dart';

class UserService {
  static Future<bool> registerUser(String name, String username, String password) async {
    if (_usernameExists(username)) return false;

    final user = User(
      id: _generateUserId(),
      name: name,
      username: username,
      password: password,
    );

    await UserRepository.insertUser(user);
    return true;
  }

  static User? loginUser(String username, String password) {
    final user = UserRepository.getUserByUsername(username);
    return (user != null && user.password == password) ? user : null;
  }

  static Future<bool> removeUser(int id) async {
    if (!UserRepository.userExists(id)) return false;
    await UserRepository.deleteUser(id);
    return true;
  }

  static User? getUser(int id) => UserRepository.getUserById(id);

  static List<User> getAllUsers() => UserRepository.getAllUsers();

  static Future<void> updateUser(User user) async {
    await UserRepository.updateUser(user);
  }

  static Future<bool> addGameToFavorites(int userId, int gameId) async {
    final user = UserRepository.getUserById(userId);
    if (user == null) return false;

    user.addFavoriteGame(gameId);
    await UserRepository.updateUser(user);
    return true;
  }

  static Future<bool> removeGameFromFavorites(int userId, int gameId) async {
    final user = UserRepository.getUserById(userId);
    if (user == null) return false;

    user.removeFavoriteGame(gameId);
    await UserRepository.updateUser(user);
    return true;
  }

  static Future<void> updateUserFavorites(int userId, List<int> favoriteIds) async {
    final user = UserRepository.getUserById(userId);
    if (user != null) {
      user.favoriteGameIds = favoriteIds;
      await UserRepository.updateUser(user);
    }
  }

  static bool _usernameExists(String username) {
    return UserRepository.getUserByUsername(username) != null;
  }

  static int _generateUserId() {
    final users = UserRepository.getAllUsers();
    if (users.isEmpty) return 1;
    return users.map((u) => u.id).reduce((a, b) => a > b ? a : b) + 1;
  }
}