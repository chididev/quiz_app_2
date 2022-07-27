import 'package:flutter/material.dart';
import 'package:quiz_app_2/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//Defining our quizbrain instance so we can access the quizbrain class.
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const QuizApp());
}

//Stateless widget will hold our constant app design.
class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text(
            'Quizzler',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        body: const QuizAppPage(),
      ),
    );
  }
}

//Stateful widget would hold our app logic and update the
//app state UI.
class QuizAppPage extends StatefulWidget {
  const QuizAppPage({Key? key}) : super(key: key);

  @override
  State<QuizAppPage> createState() => _QuizAppPageState();
}

class _QuizAppPageState extends State<QuizAppPage> {
  //This keeps a record of user scores.
  List<Icon> scoreKeeper = [];
  //This checks the user answer with the correct answer.
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      //  Pops up our alert box and resets our question number to 0.
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.info,
          title: 'ALERT',
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 200,
              child: const Text(
                'Play Again',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        quizBrain.reset();
        //Resets our scoreKeeper.
        scoreKeeper = [];
      } else {
        //Checks user answer with correct answer and updates the scoreKeeper.
        if (userAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
              size: 25.0,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
              size: 25.0,
            ),
          );
        }
      }
    });
        }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestion(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                primary: Colors.white,
              ),
              //User picked true
              onPressed: () {
                checkAnswer(true);
                quizBrain.nextQuestion();
              },
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                primary: Colors.white,
              ),
              //User picked false
              onPressed: () {
                checkAnswer(false);
                quizBrain.nextQuestion();
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
