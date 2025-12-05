import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF141518),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Usuários'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favoritos'),
      ],
      selectedItemColor: Color(0xFF8162FF),
      unselectedItemColor: Colors.white,
      onTap: (int index) {
        if (index == 1) {
          Navigator.pushReplacementNamed(context, '/Home');
        } else if (index == 0) {
          Navigator.pushReplacementNamed(context, '/usuarios');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/favoritos');
        }
      },
    );
  }
}
