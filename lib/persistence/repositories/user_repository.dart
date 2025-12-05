import 'package:hive/hive.dart';
import '../../models/user.dart';

class UserRepository {
  static const String _boxName = 'users';
  static Box<User>? _box;

  static Future<void> init() async {
    _box = await Hive.openBox<User>(_boxName);
  }

  static Box<User> get _userBox {
    if (_box == null) {
      throw Exception('User database not initialized. Call init() first.');
    }
    return _box!;
  }

  static Future<void> insertUser(User user) async {
    await _userBox.put(user.id, user);
  }

  static Future<void> deleteUser(int id) async {
    await _userBox.delete(id);
  }

  static List<User> getAllUsers() {
    return _userBox.values.toList();
  }

  static User? getUserById(int id) {
    return _userBox.get(id);
  }

  static bool userExists(int id) {
    return _userBox.containsKey(id);
  }

  static User? getUserByUsername(String username) {
    return _userBox.values.cast<User?>().firstWhere(
      (user) => user?.username == username,
      orElse: () => null,
    );
  }

  static Future<void> updateUser(User user) async {
    await _userBox.put(user.id, user);
  }

  static Future<void> close() async {
    await _box?.close();
  }
}
