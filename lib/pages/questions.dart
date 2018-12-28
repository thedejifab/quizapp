import 'package:flutter/material.dart';

import 'package:grapql_bloc/model/quiz.dart';
import 'package:grapql_bloc/widgets/question.dart';

class Questions extends StatefulWidget {
  createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  int id;
  int score;
  String currentCorrectAnswer;

  @override
  void initState() {
    super.initState();
    id = 0;
    score = 0;
    print("Init state just ran");
  }

  @override
  Widget build(BuildContext context) {
    print("Build just ran");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${id + 1} of 5",
          style: TextStyle(fontSize: 18.0),
        ),
        actions: <Widget>[
          Text("Score: $score"),
        ],
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: FutureBuilder(
          future: getQuizes(),
          builder: (BuildContext context, AsyncSnapshot<List<Quiz>> snapshot) {
            if (snapshot.hasData) {
              Quiz quiz = snapshot.data.elementAt(id);
              currentCorrectAnswer = quiz.correctOption;
              return Center(
                child: BuildQuestions(
                  quiz.question,
                  quiz.optionA,
                  quiz.optionB,
                  quiz.optionC,
                  quiz.optionD,
                ),
              );
            } else if (snapshot.hasError) {
              print("The error is ${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: nextButton(),
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
        print("Selected answer from last question is $selectedOption");
        if (selectedOption == currentCorrectAnswer) {
          setState(() {
            score++;
          });
        }
        if (id < 4) {
          setState(() {
            id++;
          });
        } else {
          print("This is the last question");
        }
      },
    );
  }
}
