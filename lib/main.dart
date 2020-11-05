import 'package:flutter/material.dart';
import './widgets/menu.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzes',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MenuPage(),
    );
  }
}