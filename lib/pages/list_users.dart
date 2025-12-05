import 'package:flutter/material.dart';
import 'package:projeto_final/shared/custom_app_bar.dart';
import 'package:projeto_final/shared/custom_menu.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(userName: 'Hugo'),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFF141518),
        child: Center(
          child: Text(
            'Lista de Usuários',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: CustomMenu(),
    );
  }
}
