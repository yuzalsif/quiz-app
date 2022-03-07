import 'package:flutter/material.dart';
import 'package:second_app/quiz.dart';
import 'package:second_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {

    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  static const List<Map<String, Object>> _questions = [
    {
      'questionKey': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'White', 'score': 3},
        {'text': 'Yellow', 'score': 15},
        {'text': 'Green', 'score': 8}
      ],
    },
    {
      'questionKey': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 15},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Goat', 'score': 1},
        {'text': 'Cow', 'score': 1}
      ],
    },
    {
      'questionKey': 'What\'s your favorite computer language?',
      'answers': [
        {'text': 'Python', 'score': 1},
        {'text': 'Java', 'score': 25},
        {'text': 'Dart', 'score': 3},
        {'text': 'Javascript', 'score': 6}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Question App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
