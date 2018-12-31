import 'package:flutter/material.dart';

import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/pages/review.dart';
import 'package:quiz_app/widgets/question.dart';

class Questions extends StatefulWidget {
  createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  int id;
  int score;
  String currentCorrectAnswer;

  List<Quiz> quizzes;
  bool areQuizzesFetched = false;
  int quizzesLength;
  int quizzesCount;

  @override
  void initState() {
    super.initState();
    id = 0;
    score = 0;

    getQuizes().whenComplete(
      () {
        setState(() {
          areQuizzesFetched = true;
        });
      },
    ).then((onValue) {
      quizzes = onValue;
      quizzesLength = quizzes.length;
      quizzesCount = quizzesLength - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (areQuizzesFetched == true) {
      Quiz quiz = quizzes.elementAt(id);
      currentCorrectAnswer = quiz.correctOption;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "${id + 1} of $quizzesLength",
            style: TextStyle(fontSize: 18.0),
          ),
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,
        ),
        body: Container(
            color: Colors.blueAccent,
            child: areQuizzesFetched != false
                ? Center(
                    child: BuildQuestions(
                      quiz.question,
                      quiz.optionA,
                      quiz.optionB,
                      quiz.optionC,
                      quiz.optionD,
                    ),
                  )
                : Center(child: CircularProgressIndicator())),
        floatingActionButton: id < quizzesCount ? nextButton() : submitButton(),
      );
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 12.0),
            Text(
              "Loading Quizzes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Next",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 3.0),
          Image(
            image: AssetImage("assets/next.png"),
            width: 30,
            height: 30,
            color: Colors.white,
          )
        ],
      ),
      onPressed: () {
        if (selectedOption == currentCorrectAnswer) {
          score++;
        }
        setState(() {
          id++;
        });
      },
    );
  }

  Widget submitButton() {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Submit",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 3.0),
          Icon(
            Icons.check,
            color: Colors.white,
          )
        ],
      ),
      onPressed: () {
        if (selectedOption == currentCorrectAnswer) {
          score++;
        }
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return Review(score, quizzesLength);
        }));
      },
    );
  }
}
