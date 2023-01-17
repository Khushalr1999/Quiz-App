import 'package:flutter/material.dart';
import 'Quiz_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quiz = Quizbrain();
void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}) : super(key: key);

  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  void flutterPop() {
    if (quiz.questionnum() > 14) {
      Alert(context: context, title: "Alert", desc: "Quiz ended").show();
      quiz.getZero();
    }
  }

  void RW(bool t) {
    if (quiz.getAnswer() == t) {
      scorekeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scorekeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  List<Icon> scorekeeper = [];
  //Question q1 =
  // Question('You can lead a cow down stairs but not up stairs.', false);
  //Question q2 = Question(
  //  'Approximately one quarter of human bones are in the feet.', true);
  // Question q3 = Question('A slug\'s blood is green.', true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quiz.getQuestion(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                RW(true);
                setState(() {
                  quiz.questionnum();
                  flutterPop();
                });
              },
              child: Text(
                'true',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                RW(false);
                setState(() {
                  quiz.questionnum();
                  flutterPop();
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
        SafeArea(child: Row(children: scorekeeper))
      ],
    );
  }
}
