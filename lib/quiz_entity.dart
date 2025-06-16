import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final int id;
  final int topicId;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? explanation;
  final String? imageUrl;
  final String? audioUrl;
  final int difficulty;
  final int orderIndex;
  final int points;
  final int timeLimit;
  final bool isActive;
  final bool isPremium;
  final List<String> tags;
  final int totalAttempts;
  final int correctAttempts;
  final double averageTimeSpent;
  final DateTime createdAt;
  final DateTime updatedAt;

  const QuizEntity({
    required this.id,
    required this.topicId,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.explanation,
    this.imageUrl,
    this.audioUrl,
    required this.difficulty,
    required this.orderIndex,
    required this.points,
    required this.timeLimit,
    required this.isActive,
    required this.isPremium,
    required this.tags,
    required this.totalAttempts,
    required this.correctAttempts,
    required this.averageTimeSpent,
    required this.createdAt,
    required this.updatedAt,
  });

  String get difficultyText {
    switch (difficulty) {
      case 1:
        return 'Beginner';
      case 2:
        return 'Intermediate';
      case 3:
        return 'Advanced';
      case 4:
        return 'Expert';
      default:
        return 'Unknown';
    }
  }

  String get correctAnswer => options[correctAnswerIndex];
  double get successRate => totalAttempts > 0 ? correctAttempts / totalAttempts : 0.0;
  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;
  bool get hasAudio => audioUrl != null && audioUrl!.isNotEmpty;
  bool get hasExplanation => explanation != null && explanation!.isNotEmpty;
  bool get hasMedia => hasImage || hasAudio;

  String get timeLimitText {
    if (timeLimit < 60) {
      return '${timeLimit}s';
    } else {
      final minutes = timeLimit ~/ 60;
      final seconds = timeLimit % 60;
      return seconds > 0 ? '${minutes}m ${seconds}s' : '${minutes}m';
    }
  }

  String get successRateText => '${(successRate * 100).toInt()}%';

  bool isCorrectAnswer(int selectedIndex) {
    return selectedIndex == correctAnswerIndex;
  }

  int getPointsForAnswer(bool isCorrect, double timeSpent) {
    if (!isCorrect) return 0;
    
    int earnedPoints = points;
    
    if (timeSpent < timeLimit * 0.5) {
      earnedPoints = (earnedPoints * 1.5).round();
    } else if (timeSpent < timeLimit * 0.75) {
      earnedPoints = (earnedPoints * 1.2).round();
    }
    
    earnedPoints = (earnedPoints * difficulty * 0.5).round();
    
    return earnedPoints;
  }

  @override
  List<Object?> get props => [
        id,
        topicId,
        question,
        options,
        correctAnswerIndex,
        explanation,
        imageUrl,
        audioUrl,
        difficulty,
        orderIndex,
        points,
        timeLimit,
        isActive,
        isPremium,
        tags,
        totalAttempts,
        correctAttempts,
        averageTimeSpent,
        createdAt,
        updatedAt,
      ];
}

