import 'package:flutter/material.dart';

import '../../models/question.dart';
import '../my_ans_btn.dart';

class QuestionUi extends StatelessWidget {
  final Question question;
  final Function next;

  const QuestionUi({Key? key, required this.question, required this.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String questionText = question.question;
    String answer = question.answer;
    List answers = question.answers;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: _QuestionWidget(
            text: questionText,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _AnswerWidget(answers: answers, onPressed: () => next()),
          ),
        ],
      ),
    );
  }
}

class _QuestionWidget extends StatelessWidget {
  final String text;
  const _QuestionWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey,
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            // color: Colors.grey,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _AnswerWidget extends StatelessWidget {
  final List answers;
  final Function onPressed;
  const _AnswerWidget(
      {Key? key, required this.answers, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var answer in answers)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MyAnsButton(
              text: answer,
              onPressed: () => onPressed(),
            ),
          ),
      ],
    );
  }
}
