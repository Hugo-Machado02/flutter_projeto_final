import 'package:flutter/material.dart';

class OperationUsers extends StatefulWidget {
  const OperationUsers({super.key});

  @override
  State<OperationUsers> createState() => _OperationUsersState();
}

class _OperationUsersState extends State<OperationUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Operation Users')));
  }
}
