import 'package:flutter/material.dart';
import 'quiz.dart';

class ScoresPage extends StatelessWidget {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Text("Result"),),
      body: Center(
        child: Text ("Your score is")
      )
    );
  }
}
