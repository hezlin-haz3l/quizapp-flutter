import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/question.dart';
import 'scores.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  String message = "";
  int score = 0;
  int questionNumber = 0;
  @override
  void initState() {
    // TODO implement initState
    super.initState();
    this.fetchQuestions().then((response) {
      setState(() {
        questions = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(questions);
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Game"),
      ),
      body: Column(
        children: <Widget>[
          Text(questions.length > 0 ? questions[questionNumber].question : ""),
          questions.length > 0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: questions[questionNumber].options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: Colors.amberAccent,
                              child: GestureDetector(
                                child: Text(
                                  questions[questionNumber].options[index],
                                  style: TextStyle(fontSize: 32),
                                ),
                                onTap: () {
                                  if (questions[questionNumber]
                                          .options[index] ==
                                      questions[questionNumber].correctAnswer) {
                                    setState(() {
                                      message = "Correct!";
                                      score = score + 1;
                                      questionNumber = questionNumber + 1;
                                    });
                                  } else {
                                    setState(() {
                                      message = "Incorrect!";
                                      questionNumber = questionNumber + 1;
                                    });
                                  }
                                  if (questionNumber < 9) {
                                    setState(() {
                                      questionNumber = questionNumber + 1;
                                    });
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ScoresPage()));
                                  }
                                },
                              )),
                        );
                      }),
                )
              : Container(),
          Text(message)
        ],
      ),
    );
  }

  Future<List<Question>> fetchQuestions() async {
    final response =
        await http.get("https://opentdb.com/api.php?amount=10&category=18");
    if (response.statusCode == 200) {
      return Question.questionsFromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load questions");
    }
  }
}
