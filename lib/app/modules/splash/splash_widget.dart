import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/splash/splash_controller.dart';
import 'package:pokemon/utils/texts.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final controller = Modular.get<SplashController>();

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  startSplashScreenTimer() {
    Duration splashScreen = const Duration(seconds: 1);
    return Timer(splashScreen, controller.checkUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Image.asset(
              'assets/pikachu_auth.png',
            ),
          ),
          Text(
            "Bem vindo ao Pokémon CHALLENGE",
            style: tsLight,
          ),
          Text(
            "Autor: Matheus Melo",
            style: tsLight,
          ),
        ],
      )),
    );
  }
}
