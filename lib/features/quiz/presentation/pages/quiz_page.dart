import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  final String quizId;
  const QuizPage({super.key, required this.quizId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz $quizId')),
      body: Center(child: Text('Quiz Page for ID: $quizId')),
    );
  }
}
