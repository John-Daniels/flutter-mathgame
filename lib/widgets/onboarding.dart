import 'package:flutter/material.dart';

import '../logic/game.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    startGame() {
      // Navigator.of(context).pushReplacementNamed('/game');
      Navigator.of(context).popAndPushNamed('/game');
    }

    return Scaffold(
      body: FutureBuilder(
        future: GameData.getScore(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final int score = snapshot.data as int;

            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'MathGame',
                      textScaleFactor: 2,
                    ),
                  ),
                  SizedBox(height: screen.height * 0.3),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _HighScore(
                          score: score,
                        ),
                        SizedBox(
                          height: screen.height / 100,
                        ),
                        const Text(
                          'Welcome MathGurus!',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: startGame,
                              child: const Text('StartGame')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _HighScore extends StatelessWidget {
  final int score;
  const _HighScore({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return score > 0
        ? Column(
            children: [
              const Text(
                'High Score',
                textScaleFactor: 3,
              ),
              Text('$score', textScaleFactor: 3),
            ],
          )
        : Container();
  }
}
