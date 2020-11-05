import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'quiz.dart';


class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz App!"),),
        body: Column (
            children: [
          Image.network("https://img.favpng.com/14/12/25/pub-quiz-royalty-free-png-favpng-2Rn1LUGUQzBTvqEkAaTGBUFn8.jpg"),
    FlatButton(
        color: Colors.red,
    child: Text("Start the Game"),
    onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizPage()));
    }
    ),
    FlatButton (
        color: Colors.green,
        child: Text("Hi score"),
        onPressed: (){

        },
    ),
    FlatButton (
    color: Colors.blue,
    child: Text("About Us"),
    onPressed: () {

    },
    )
    ]

    )
    );
  }
}
