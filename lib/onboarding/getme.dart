// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GetMe extends StatelessWidget {
  const GetMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: Text(
          'G E T M E',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
