import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../logic/game.dart';
import '../models/question.dart';
import '../widgets/questionUi/questionui.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var data =
        await rootBundle.loadString('assets/files/data.json', cache: true);
    var parsedData = jsonDecode(data);

    var questions = parsedData['questions'];

    GameData.questions = List.from(questions)
        .map<Question>((question) => Question.fromMap(question))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameData.questions.isNotEmpty
          ? GameOverlay(questions: GameData.questions)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class GameOverlay extends StatefulWidget {
  final List<Question> questions;
  const GameOverlay({Key? key, required this.questions}) : super(key: key);

  @override
  State<GameOverlay> createState() => _GameOverlayState();
}

class _GameOverlayState extends State<GameOverlay> {
  int index = 0;
  int score = 0;
  // ui stuff
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    List _questions = widget.questions;
    bool finished = !(index < _questions.length);

    load() {
      if (!(index < _questions.length)) {
        Future.delayed(const Duration(seconds: 3));

        setState(() {
          loading = false;
        });
      }
    }

    _saveScore() {
      if (!(index < _questions.length)) {
        GameData.saveScore(score);
      }
    }

    return finished == false
        ? QuestionUi(
            qIndex: index + 1,
            question: _questions[index],
            next: (ans, realAns) {
              if (ans == realAns) score++;
              index++;
              setState(() {});

              load();
              _saveScore();
            },
          )
        : !loading
            ? FinishedScreen(
                score: score,
                maxScore: _questions.length,
                goto: () => Navigator.of(context).pushReplacementNamed('/home'),
                restart: () => setState(() {
                  score = 0;
                  index = 0;
                }),
              )
            : const Center(child: CircularProgressIndicator());
  }
}

class FinishedScreen extends StatelessWidget {
  final int score;
  final int maxScore;
  final goto;
  final restart;

  const FinishedScreen(
      {Key? key,
      required this.score,
      required this.maxScore,
      required this.goto,
      required this.restart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    //TODO: remember to add some media queries that can help set width to screen percent
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Score',
                  textScaleFactor: 3,
                  style: TextStyle(color: Color.fromARGB(255, 102, 101, 101)),
                ),
                Text(
                  '$score/$maxScore',
                  textScaleFactor: 2,
                  // style: const TextStyle(color: Colors.grey),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () => restart(),
                          child: const Text('replay')),
                      ElevatedButton(
                          onPressed: () => goto(),
                          child: const Text('Go Back')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
