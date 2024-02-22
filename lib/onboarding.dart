// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/onboarding/getme.dart';

import 'onboarding/hello.dart';
import 'onboarding/welcome.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  void initState() {
    setUsed();
    super.initState();
  }

  void setUsed() async {
    final SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setBool('appUsed', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Hello(),
          Welcome(),
          GetMe(),
        ],
      ),
    );
  }
}
