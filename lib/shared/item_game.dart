import 'package:flutter/material.dart';

class ItemGame extends StatefulWidget {
  final int id;
  final String title;
  final String urlImage;
  final String txt_btn;

  const ItemGame({
    super.key,
    required this.id,
    required this.title,
    required this.urlImage,
    required this.txt_btn,
  });

  @override
  State<ItemGame> createState() => _ItemGameState();
}

class _ItemGameState extends State<ItemGame> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1B1F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF26272B), width: 1.0),
      ),
      child: SizedBox(
        height: 280.0,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(widget.urlImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 40,
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF26272B,
                    ), // Cor de destaque para o botão
                  ),
                  onPressed: () {
                    print("Adicionado aos Favoritos: ${widget.title}");
                  },
                  child: Center(
                    child: Text(
                      widget.txt_btn,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
