import 'package:equatable/equatable.dart';

class UserProgressEntity extends Equatable {
  final int id;
  final int userId;
  final int lessonId;
  final double progressPercentage;
  final List<int> completedTopicIds;
  final List<QuizAnswerEntity> answers;
  final int totalXpEarned;
  final int totalTimeSpentMinutes;
  final int totalQuizAttempts;
  final int correctQuizAnswers;
  final double averageScore;
  final double bestScore;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? lastAccessedAt;
  final bool isCompleted;
  final bool isFavorite;
  final int streakCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProgressEntity({
    required this.id,
    required this.userId,
    required this.lessonId,
    required this.progressPercentage,
    required this.completedTopicIds,
    required this.answers,
    required this.totalXpEarned,
    required this.totalTimeSpentMinutes,
    required this.totalQuizAttempts,
    required this.correctQuizAnswers,
    required this.averageScore,
    required this.bestScore,
    this.startedAt,
    this.completedAt,
    this.lastAccessedAt,
    required this.isCompleted,
    required this.isFavorite,
    required this.streakCount,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isStarted => startedAt != null;
  bool get isInProgress => isStarted && !isCompleted;
  double get quizAccuracy => totalQuizAttempts > 0 ? correctQuizAnswers / totalQuizAttempts : 0.0;
  String get progressText => '${(progressPercentage * 100).toInt()}%';
  String get accuracyText => '${(quizAccuracy * 100).toInt()}%';

  String get timeSpentText {
    if (totalTimeSpentMinutes < 60) {
      return '${totalTimeSpentMinutes}m';
    } else {
      final hours = totalTimeSpentMinutes ~/ 60;
      final minutes = totalTimeSpentMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
    }
  }

  Duration? get timeSinceLastAccess {
    if (lastAccessedAt == null) return null;
    return DateTime.now().difference(lastAccessedAt!);
  }

  Duration? get timeToComplete {
    if (startedAt == null || completedAt == null) return null;
    return completedAt!.difference(startedAt!);
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        lessonId,
        progressPercentage,
        completedTopicIds,
        answers,
        totalXpEarned,
        totalTimeSpentMinutes,
        totalQuizAttempts,
        correctQuizAnswers,
        averageScore,
        bestScore,
        startedAt,
        completedAt,
        lastAccessedAt,
        isCompleted,
        isFavorite,
        streakCount,
        createdAt,
        updatedAt,
      ];
}

class QuizAnswerEntity extends Equatable {
  final int quizId;
  final int selectedAnswerIndex;
  final bool isCorrect;
  final double timeSpent;
  final int xpEarned;
  final double score;
  final DateTime answeredAt;
  final String? explanation;

  const QuizAnswerEntity({
    required this.quizId,
    required this.selectedAnswerIndex,
    required this.isCorrect,
    required this.timeSpent,
    required this.xpEarned,
    required this.score,
    required this.answeredAt,
    this.explanation,
  });

  String get timeSpentText {
    if (timeSpent < 60) {
      return '${timeSpent.toInt()}s';
    } else {
      final minutes = (timeSpent / 60).floor();
      final seconds = (timeSpent % 60).toInt();
      return '${minutes}m ${seconds}s';
    }
  }

  String get scoreText => '${score.toInt()}%';

  @override
  List<Object?> get props => [
        quizId,
        selectedAnswerIndex,
        isCorrect,
        timeSpent,
        xpEarned,
        score,
        answeredAt,
        explanation,
      ];
}

