import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    return QuestionUi(
      qNum: index + 1,
      question: widget.questions[index],
      next: () {
        setState(() {
          index++;
        });
      },
    );
  }
}
