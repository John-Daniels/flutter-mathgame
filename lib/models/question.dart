class Question {
  final String question;
  final List answers;
  final String answer;

  Question({
    required this.question,
    required this.answer,
    required this.answers,
  });

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

