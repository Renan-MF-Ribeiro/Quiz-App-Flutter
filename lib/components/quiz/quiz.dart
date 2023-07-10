import 'package:flutter/material.dart';

import '../question.dart';
import '../responses.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;

  final int selectedQuestion;
  final void Function(int) answerQuestion;

  Quiz(
      {required this.questions,
      required this.selectedQuestion,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[selectedQuestion]['title'].toString()),
        ...questions[selectedQuestion]
            .cast()['responses']
            ?.map((t) => Response(t['title'], () => answerQuestion(t['value'])))
            .toList()
      ],
    );
  }
}
