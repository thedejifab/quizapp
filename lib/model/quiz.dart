import 'dart:convert';

import 'package:http/http.dart' as http;

class Quiz {
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctOption;

  Quiz(
      {this.question,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.correctOption});
}

Future<List<Quiz>> getQuizes() async {
  String endPoint =
      'https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple';
  final response =
      await http.get(endPoint, headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return quizzesFromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load quizzes");
  }
} 

List<Quiz> quizzesFromJson(Map<String, dynamic> json) {
  List quizData = json['results'];
  List<Quiz> quizzes = new List();
  for (int i = 0; i < quizData.length; i++) {
    var quizItem = quizData[i];
    Quiz quiz = Quiz(
      question: quizItem['question'],
      optionA: quizItem['incorrect_answers'][0],
      optionB: quizItem['incorrect_answers'][1],
      optionC: quizItem['incorrect_answers'][2],
      optionD: quizItem['correct_answer'],
      correctOption: quizItem['correct_answer'],
    );
    quizzes.add(quiz);
  }
  return quizzes;
}
