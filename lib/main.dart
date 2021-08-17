// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/app_module.dart';
import 'package:pokemon/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
