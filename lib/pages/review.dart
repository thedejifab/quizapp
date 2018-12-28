import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final int score;
  final int questionsCount;
  Review(this.score, this.questionsCount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            Text(
              "Congratulations!",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24.0),
            Row(
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
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 8.0,
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {},
                  color: Colors.blueAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        "Share",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.0),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 8.0,
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {},
                  color: Colors.lightBlue,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        "Tweet",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 24.0),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.restore),
                  SizedBox(width: 6.0),
                  Text("Restart Quiz"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
