import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final Color color;
  final String text;
  const MyText({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color));
  }
}
