import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game.dart';

class GamesApiService {
  static const String _baseUrl = 'https://api.rawg.io/api';
  static const String _apiKey = '78ef60a66cae4772881cd31dd4fe345d';

  static Future<List<Game>> fetchGames({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final url =
          '$_baseUrl/games?key=$_apiKey&ordering=-rating&page=$page&page_size=$pageSize';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> gamesJson = data['results'];

        return gamesJson
            .map(
              (json) => Game(
                id: json['id'],
                title: json['name'],
                urlImage:
                    json['background_image'] ??
                    'https://via.placeholder.com/300x400',
              ),
            )
            .toList();
      } else {
        throw Exception('Erro ao carregar jogos: ${response.statusCode}');
      }
    } catch (e) {
      return _getFallbackGames();
    }
  }

  static Future<List<Game>> searchGames(String query) async {
    try {
      final url =
          '$_baseUrl/games?key=$_apiKey&search=$query&ordering=-rating&page_size=25';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> gamesJson = data['results'];

        return gamesJson
            .map(
              (json) => Game(
                id: json['id'],
                title: json['name'],
                urlImage:
                    json['background_image'] ??
                    'https://via.placeholder.com/300x400',
              ),
            )
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static List<Game> _getFallbackGames() {
    return [
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
}
