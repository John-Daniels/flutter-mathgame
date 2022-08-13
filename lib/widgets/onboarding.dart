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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'MathGame',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 29),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/math1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // SizedBox(height: screen.height * 0.3),
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
