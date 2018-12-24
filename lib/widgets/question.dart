import 'package:flutter/material.dart';

import 'package:grapql_bloc/widgets/option.dart';
import 'package:grapql_bloc/pages/questions.dart';

String selectedOption;
class BuildQuestions extends StatefulWidget {
  createState() => _BuildQuestionsState();

  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  BuildQuestions(
      this.question, this.optionA, this.optionB, this.optionC, this.optionD);
}

class _BuildQuestionsState extends State<BuildQuestions> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double deviceWidth = deviceSize.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: deviceWidth * 0.05),
              child: Text(
                widget.question,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Center(
              child: Container(
                width: deviceWidth * 0.85,
                child: Card(
                  elevation: 8.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _option(widget.optionA),
                      Divider(color: Colors.grey),
                      _option(widget.optionB),
                      Divider(color: Colors.grey),
                      _option(widget.optionC),
                      Divider(color: Colors.grey),
                      _option(widget.optionD),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _option(String option) {
    return InkWell(
      onTap: () {
        setState(() {          
          selectedOption = option;
        });
      },
      child: Row(
        children: <Widget>[
          Radio(
            value: option,
            groupValue: selectedOption,
            onChanged: (value) {},
            activeColor: Colors.black,
          ),
          Expanded(
            child: Text(option),
          ),
          SizedBox(width: 2.0),
        ],
      ),
    );
  }
}
