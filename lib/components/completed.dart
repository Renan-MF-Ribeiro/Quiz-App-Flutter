import 'package:flutter/material.dart';

class CompletedQuestions extends StatelessWidget {
  final int score;
  final void Function() reset;
  const CompletedQuestions(this.score, this.reset, {super.key});

  String get result {
    if (score < 8) {
      return 'Parabéns: $score';
    } else if (score < 12) {
      return 'Legal: $score';
    } else if (score < 16) {
      return 'Impressionante: $score';
    } else {
      return 'Jedi: $score';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          result,
          style: TextStyle(fontSize: 28),
        ),
        ElevatedButton(
          child: Text('Reiniciar'),
          onPressed: reset,
        )
      ],
    ));
  }
}
