import 'package:flutter/material.dart';

import '../../models/question.dart';
import '../dialog/dialog.dart';
import '../my_ans_btn.dart';

class QuestionUi extends StatelessWidget {
  final Question question;
  final int qIndex;
  final next;

  const QuestionUi({
    Key? key,
    required this.question,
    required this.qIndex,
    required this.next,
  }) : super(key: key);

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
            child: Stack(
              children: [
                _QuestionWidget(
                  text: questionText,
                ),
                Positioned(
                  // center the pic
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: double.infinity,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          '$qIndex',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            barrierColor: Colors.black26,
                            context: context,
                            builder: (context) {
                              return MyDialog(
                                title: "Do you wanna quit!",
                                description:
                                    "if you quit your progress will be lost!",
                                onQuit: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                },
                              );
                            });
                      },
                      icon: const Icon(Icons.cancel),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Expanded(
          //     child: _QuestionWidget(
          //   text: questionText,
          // )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _AnswerWidget(
                answers: answers, answer: question.answer, onPressed: next),
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
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 4),
          ]),
      width: double.infinity,
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
  final String answer;
  final onPressed;
  const _AnswerWidget({
    Key? key,
    required this.answers,
    required this.onPressed,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var _answer in answers)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MyAnsButton(
              text: _answer,
              onPressed: () => onPressed(_answer, answer),
            ),
          ),
      ],
    );
  }
}
