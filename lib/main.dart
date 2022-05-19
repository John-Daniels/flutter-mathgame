import 'package:flutter/material.dart';
import 'package:mathgame/pages/game_screen.dart';
import 'package:mathgame/theme/theme.dart';

import 'widgets/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: MyThemes.darkTheme,
      theme: MyThemes.lightTheme,
      themeMode: ThemeMode.light,
      home: const OnBoarding(),
      routes: {
        '/home': (context) => const OnBoarding(),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}
