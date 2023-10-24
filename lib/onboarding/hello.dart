// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      body: Center(
        child: Text(
          'H E L L O',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
