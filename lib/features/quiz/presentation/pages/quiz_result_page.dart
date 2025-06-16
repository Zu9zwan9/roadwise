// TODO Implement this library.
import 'package:flutter/material.dart';

class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final int correctAnswers;
  final Duration timeSpent;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.timeSpent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Results')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Score: $score / $totalQuestions'),
            const SizedBox(height: 8),
            Text('Correct Answers: $correctAnswers'),
            const SizedBox(height: 8),
            Text(
              'Time Spent: ${timeSpent.inMinutes}m ${timeSpent.inSeconds.remainder(60)}s',
            ),
          ],
        ),
      ),
    );
  }
}
