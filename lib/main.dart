import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is the generic name for Levaquin?',
      'answers': [
        {'text': 'cinoxacin', 'score': -2},
        {'text': 'lomefloxacin', 'score': -2},
        {'text': 'levofloxacin', 'score': 10},
        {'text': 'ciprofloxacin', 'score': -2},
      ],
    },
    {
      'questionText': 'What is the generic name for Lipitor?',
      'answers': [
        {'text': 'lovastatin', 'score': -2},
        {'text': 'fluvastatin', 'score': -2},
        {'text': 'simvastatin', 'score': -2},
        {'text': 'atorvastatin', 'score': 10},
      ],
    },
    {
      'questionText': ' What is the generic name for Protonix?',
      'answers': [
        {'text': 'famotidine', 'score': -2},
        {'text': 'pantoprazole', 'score': 10},
        {'text': 'esomeprazole', 'score': -2},
        {'text': 'propranolol', 'score': -2},
      ],
    },
    {
      'questionText': 'What is the generic name for Seroquel?',
      'answers': [
        {'text': 'quetiapine', 'score': 10},
        {'text': 'olanzapine', 'score': -2},
        {'text': 'olanzapine/fluoxetine', 'score': -2},
        {'text': 'clozapine', 'score': -2},
      ],
    },
    {
      'questionText':
      'Q5. What is the generic name for Lyrica??',
      'answers': [
        {'text': 'primidone','score': -2,},
        {'text': 'pregabalin', 'score': 10},
        {'text': 'phenytoin', 'score': -2},
        {'text': 'clonazepam', 'score': -2},
      ],
    },
  ];

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
          title: Text('Drugs'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ),
       //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
