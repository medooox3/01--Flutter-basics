import 'package:flutter/material.dart';
import 'package:i01_flutter_basics/answer.dart';
import './question.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final questions = const [
    {
      "question text": "What's your favorite color?",
      "answers": ["Red", "Black", "Blue", "White"]
    },
    {
      "question text": "What's your favorite animal?",
      "answers": ["Cat", "Dog", "Horse", "Mouse"]
    },
    {
      "question text": "What would you like to learn?",
      "answers": ["Dart", "Flutter", "Design patterns", "Algorithms"]
    },
  ];
  void _answerQuestion() {
    setState(() {
      // _questionIndex = _questionIndex >= questions.length -1 ? 0 : _questionIndex + 1;
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is my flutter App"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]["question text"]),
                  ...(questions[_questionIndex]["answers"] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(child: Text("You did it!")),
      ),
    );
  }
}
