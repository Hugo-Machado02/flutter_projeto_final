import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Game {
  Game({required this.id, required this.title, required this.urlImage});

  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String urlImage;
}
