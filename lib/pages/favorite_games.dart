import 'package:flutter/material.dart';
import 'package:projeto_final/models/game.dart';
import 'package:projeto_final/shared/custom_app_bar.dart';
import 'package:projeto_final/shared/custom_menu.dart';
import 'package:projeto_final/shared/item_game.dart';

class FavoriteGames extends StatefulWidget {
  const FavoriteGames({super.key});

  @override
  State<FavoriteGames> createState() => _FavoriteGamesState();
}

class _FavoriteGamesState extends State<FavoriteGames> {
  List<Game> games = [
    Game(
      id: 3,
      title: "Red Dead Redemption 2",
      urlImage:
          "https://media.rawg.io/media/games/52b/52be96c19be0d79eeb8664e4ca2aabd5.jpg",
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(userName: 'Hugo'),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFF141518),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 16.0,
                top: 8.0,
              ),
              child: Text(
                'Favoritos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
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
                    txt_btn: "Remover",
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomMenu(),
    );
  }
}
