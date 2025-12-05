import 'package:flutter/material.dart';
import 'package:projeto_final/models/game.dart';
import 'package:projeto_final/shared/custom_app_bar.dart';
import 'package:projeto_final/shared/custom_menu.dart';
import 'package:projeto_final/shared/item_game.dart';

class ListGames extends StatefulWidget {
  const ListGames({super.key});

  @override
  State<ListGames> createState() => _ListGamesState();
}

class _ListGamesState extends State<ListGames> {
  List<Game> games = [
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
    Game(
      id: 6,
      title: "The Witcher 3",
      urlImage:
          "https://media.rawg.io/media/games/52b/52be96c19be0d79eeb8664e4ca2aabd5.jpg",
    ),
    Game(
      id: 7,
      title: "Minecraft",
      urlImage:
          "https://media.rawg.io/media/games/6fc/6fcf4cd3b17c288821388e6085bb0fc9.jpg",
    ),
    Game(
      id: 8,
      title: "Grand Theft Auto V",
      urlImage:
          "https://media.rawg.io/media/games/b54/b54598d1d5cc31899f4f0a7e3122a7b0.jpg",
    ),
    Game(
      id: 9,
      title: "Hogwarts Legacy",
      urlImage:
          "https://media.rawg.io/media/games/52b/52be96c19be0d79eeb8664e4ca2aabd5.jpg",
    ),
    Game(
      id: 10,
      title: "Diablo IV",
      urlImage:
          "https://media.rawg.io/media/games/6fc/6fcf4cd3b17c288821388e6085bb0fc9.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(userName: 'Hugo'),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFF141518),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: games.length,
            itemBuilder: (context, index) {
              final gamesElement = games[index];

              return ItemGame(
                id: gamesElement.id,
                title: gamesElement.title,
                urlImage: gamesElement.urlImage,
                txt_btn: "Favoritar",
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomMenu(),
    );
  }
}
