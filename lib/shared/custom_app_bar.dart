import 'package:flutter/material.dart';
import 'package:projeto_final/pages/perfil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;

  const CustomAppBar({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF141518),
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Olá, Hugo!',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF8162FF),
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings, size: 25, color: Colors.white),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Perfil()),
              ),
            },
          ),
        ],
      ),
      shape: const Border(
        bottom: BorderSide(
          color: Color(0xFF26272B), // Cor da sua borda
          width: 1.0, // Espessura da borda
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
