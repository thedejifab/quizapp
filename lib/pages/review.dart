import 'package:flutter/material.dart';
import 'package:quiz_app/pages/questions.dart';

class Review extends StatelessWidget {
  final int score;
  final int questionsCount;
  Review(this.score, this.questionsCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Card(
        margin:
            EdgeInsets.only(left: 24.0, right: 24.0, top: 60.0, bottom: 72.0),
        elevation: 8.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/trophy.png",
            ),
            SizedBox(height: 60.0),
            Text( 
              "Congratulations!",
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24.0),
            scoreAnalysis(score, questionsCount),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                shareButton(Colors.blueAccent, "Share", "assets/facebook.png"),
                SizedBox(width: 12.0),
                shareButton(Colors.lightBlue, "Tweet", "assets/twitter.png"),
              ],
            ),
            SizedBox(height: 72.0),
            restartButton(context),
          ],
        ),
      ),
    );
  }
}

Widget markAndIcon() {}

Widget scoreAnalysis(int score, int questionsCount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.check,
        color: Colors.green,
      ),
      Text("$score correct"),
      SizedBox(width: 12.0),
      Icon(
        Icons.cancel,
        color: Colors.red,
      ),
      Text("${questionsCount - score} incorrect"),
    ],
  );
}

Widget shareButton(Color color, String action, String imageData) {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    elevation: 8.0,
    padding: EdgeInsets.all(0.0),
    onPressed: () {},
    color: color,
    child: Row(
      children: <Widget>[
        Container(
          height: 24,
          width: 24,
          child: Image(
            color: Colors.white,
            image: AssetImage(imageData),
          ),
        ),
        SizedBox(width: 6.0),
        Text(
          action,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}


Widget restartButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return Questions();
      }));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.restore),
        SizedBox(width: 6.0),
        Text("Restart Quiz"),
      ],
    ),
  );
}
