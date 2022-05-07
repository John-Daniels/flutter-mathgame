import 'package:flutter/material.dart';
import 'package:mathgame/models/question.dart';

import '../pages/game.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int score = GameData.score;
  @override
  void initState() {
    super.initState();

    load();
  }

  load() {
    GameData.getScore();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    startGame() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const GameScreen()));
    }

    return Scaffold(
        appBar: AppBar(title: const Text('MathGame'), centerTitle: true),
        body: score.toInt() >= 0
            ? SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$score'),
                    const Text(
                      'Welcome to the Game!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: startGame, child: const Text('StartGame')),
                    )
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
