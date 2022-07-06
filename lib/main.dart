import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State < StatefulWidget > createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State < MyApp > {
  final _questions =
  const [{
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black','score': 10}, 
        {'text': 'Red','score': 9}, 
        {'text': 'Green','score': 8}, 
        {'text': 'White','score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text':'Dog','score': 10}, 
        {'text':'Cat','score': 9}, 
        {'text':'Rabbit','score': 8}, 
        {'text':'Hamster','score': 7}
        ],
    },
    {
      'questionText': 'Who\'s your favorite artist?',
      'answers': [
        {'text':'Chris Brown','score': 10},
        {'text':'Kehlani','score': 9}, 
        {'text':'Aaliyah','score': 8}, 
        {'text':'Bryson Tiller','score': 7}
        ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length ?
        Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        ) :
        Result(),
      ),
    );
  }
}