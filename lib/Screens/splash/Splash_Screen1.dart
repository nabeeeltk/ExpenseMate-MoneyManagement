// ignore_for_file: camel_case_types
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:save_money/Screens/Home_Screen.dart';
import 'package:save_money/Screens/splash/splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:save_money/home/widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_screen_demo extends StatefulWidget {
  const splash_screen_demo({super.key});

  @override
  State<splash_screen_demo> createState() => _splash_screen_demoState();
}

class _splash_screen_demoState extends State<splash_screen_demo> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 7),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const splash_screen())));
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: TextLiquidFill(
            text: "ExpenseMate",
            waveColor: Colors.black,
            boxBackgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 100,
          ),
        ),
      ),
    );
  }
  Future<void> goToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool a = prefs.getBool('check') ?? false;
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage()));
}
}
