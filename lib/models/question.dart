import 'package:shared_preferences/shared_preferences.dart';

class GameData {
  static List<Question> questions = [];

  static int score = 0;

  static getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int counter = (prefs.getInt('counter') ?? 0);

    score = counter;
    return counter;
  }

  saveScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score);
  }
}

class Question {
  final String question;
  final List answers;
  final String answer;

  Question(
      {required this.question, required this.answer, required this.answers});

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'],
      answers: map['answers'],
      answer: map['answer'],
    );
  }
}

// {
//   questions: [
//     {
//       question: '',
//       answers: ['','','','',''],
//       answer: [],
//     }
//   ]
// }

