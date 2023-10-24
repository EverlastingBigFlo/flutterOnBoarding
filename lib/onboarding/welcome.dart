// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[500],
      body: Center(
        child: Text(
          'W E L C O M E',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
