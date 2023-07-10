// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'components/completed.dart';
import 'components/quiz/quiz.dart';

void main() => runApp(QuestionApp());

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  var selectedQuestion = 0;
  int _score = 0;

  final _questions = const [
    {
      'title': 'Qual a sua cor favoria?',
      'responses': [
        {'title': 'Azul', 'value': 10},
        {'title': 'Vermelho', 'value': 5},
        {'title': 'Preto', 'value': 3},
        {'title': 'Verde', 'value': 1},
      ]
    },
    {
      'title': 'Qual o seu animal favoria?',
      'responses': [
        {'title': 'Elefante', 'value': 10},
        {'title': 'Tigre', 'value': 5},
        {'title': 'Leão', 'value': 3},
        {'title': 'Zebra', 'value': 1},
      ]
    },
    {
      'title': 'Qual a sua fruta favoria?',
      'responses': [
        {'title': 'Melancia', 'value': 10},
        {'title': 'Limão', 'value': 5},
        {'title': 'Laranja', 'value': 3},
        {'title': 'Uva', 'value': 1},
      ]
    },
  ];

  void answerQuestion(int value) {
    if (haveQuestion) {
      setState(() {
        selectedQuestion++;
        _score += value;
      });
    }
  }

  void restarQuiz() {
    setState(() {
      selectedQuestion = 0;
      _score = 0;
    });
  }

  bool get haveQuestion {
    return selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text(
            'Perguntas',
            textAlign: TextAlign.center,
          ),
          centerTitle: true),
      body: haveQuestion
          ? Quiz(
              questions: _questions,
              selectedQuestion: selectedQuestion,
              answerQuestion: answerQuestion)
          : CompletedQuestions(_score, restarQuiz),
    ));
  }
}
