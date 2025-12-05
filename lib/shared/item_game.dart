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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1B1F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.urlImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF26272B),
                        child: const Icon(
                          Icons.games,
                          color: Color(0xFF8162FF),
                          size: 48,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 44,
                child: Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF8162FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      print("Ação: ${widget.txt_btn} - ${widget.title}");
                    },
                    child: Center(
                      child: Text(
                        widget.txt_btn,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
