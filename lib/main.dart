import 'package:flutter/material.dart';
import 'package:quizzer/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 62, 62, 62),
          body: Quizzer(),
        ),
      ),
    ),
  );
}

class Quizzer extends StatefulWidget {
  const Quizzer({super.key});

  @override
  State<Quizzer> createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  Quiz_brain quiz_brain = Quiz_brain();
  void nextQuestion(bool answer) {
    if (quiz_brain.getTrackingNum() > quiz_brain.listlenght() - 2) {
      print("this is out of range");
      quiz_brain.resetTrackingNum();
      quiz_brain.icons.clear();
      _onBasicAlertPressed(context);
    } else {
      print("keep going");
      print(quiz_brain.listlenght());
      print(quiz_brain.getTrackingNum());
      quiz_brain.correctAnswer(answer);
      quiz_brain.increaseTrackingNum();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 0.0, right: 10, bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                quiz_brain.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              // true
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: BeveledRectangleBorder()),
                  onPressed: () {
                    setState(() {
                      nextQuestion(true);
                    
                    });
                  },
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
          SizedBox(
            height: 30,
          ),
          Expanded(
              flex: 1,
              // false
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: BeveledRectangleBorder()),
                  onPressed: () {
                    setState(() {
                      nextQuestion(false);

                    });
                  },
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
          SizedBox(
            height: 15,
          ),
          Row(children: quiz_brain.icons)
        ],
      ),
    );
  }

  _onBasicAlertPressed(context) async {
    await Alert(
      context: context,
      title: "Quiz",
      desc: "The quiz is over you did great!. Restarting...",
    ).show();
  }
}
