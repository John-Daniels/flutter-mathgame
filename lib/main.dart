import 'package:flutter/material.dart';
import 'package:mathgame/pages/game.dart';

import 'widgets/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const OnBoarding(),
      routes: {
        '/home': (context) => const OnBoarding(),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}
