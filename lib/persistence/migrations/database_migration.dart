import 'package:hive/hive.dart';
import '../repositories/user_repository.dart';
import '../../models/user.dart';

class DatabaseMigration {
  static const String _migrationKey = 'migration_version';
  static const int _currentVersion = 1;

  static Future<void> runMigrations() async {
    final box = await Hive.openBox('app_config');
    final currentVersion = box.get(_migrationKey, defaultValue: 0);

    if (currentVersion < _currentVersion) {
      await _createDefaultAdmin();
      await box.put(_migrationKey, _currentVersion);
    }
  }

  static Future<void> _createDefaultAdmin() async {
    final adminExists = UserRepository.getAllUsers()
        .any((user) => user.username == 'admin@gmail.com');
    
    if (!adminExists) {
      final admin = User(
        id: 1,
        name: 'Admin',
        username: 'admin@gmail.com',
        password: 'Admin@123',
      );
      await UserRepository.insertUser(admin);
    }
  }
}