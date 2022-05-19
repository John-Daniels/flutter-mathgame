import 'package:shared_preferences/shared_preferences.dart';

import '../models/question.dart';

class GameData {
  static List<Question> questions = [];

  static int score = 0;

  static getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int _score = (prefs.getInt('score') ?? 0);

    score = _score;
    return _score;
  }

  static void saveScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score);
  }
}
