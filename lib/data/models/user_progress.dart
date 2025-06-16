import 'package:isar/isar.dart';

part 'user_progress.g.dart';

@collection
class UserProgress {
  Id id = Isar.autoIncrement;

  late int userId;

  late int lessonId;

  double progressPercentage = 0.0;

  List<int> completedTopicIds = [];

  List<QuizAnswer> answers = [];

  int totalXpEarned = 0;

  int totalTimeSpentMinutes = 0;

  int totalQuizAttempts = 0;

  int correctQuizAnswers = 0;

  double averageScore = 0.0;

  double bestScore = 0.0;

  DateTime? startedAt;

  DateTime? completedAt;

  DateTime? lastAccessedAt;

  bool isCompleted = false;

  bool isFavorite = false;

  int streakCount = 0;

  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();

  // Computed properties
  bool get isStarted => startedAt != null;

  bool get isInProgress => isStarted && !isCompleted;

  double get quizAccuracy =>
      totalQuizAttempts > 0 ? correctQuizAnswers / totalQuizAttempts : 0.0;

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

  @ignore
  Duration? get timeSinceLastAccess {
    if (lastAccessedAt == null) return null;
    return DateTime.now().difference(lastAccessedAt!);
  }

  @ignore
  Duration? get timeToComplete {
    if (startedAt == null || completedAt == null) return null;
    return completedAt!.difference(startedAt!);
  }

  // Methods
  void startLesson() {
    startedAt ??= DateTime.now();
    lastAccessedAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  void completeLesson() {
    isCompleted = true;
    completedAt = DateTime.now();
    progressPercentage = 1.0;
    updatedAt = DateTime.now();
  }

  void updateProgress(double newProgress) {
    progressPercentage = newProgress.clamp(0.0, 1.0);
    lastAccessedAt = DateTime.now();
    updatedAt = DateTime.now();

    if (progressPercentage >= 1.0 && !isCompleted) {
      completeLesson();
    }
  }

  void addCompletedTopic(int topicId) {
    if (!completedTopicIds.contains(topicId)) {
      completedTopicIds.add(topicId);
      updatedAt = DateTime.now();
    }
  }

  void addQuizAnswer(QuizAnswer answer) {
    answers.add(answer);
    totalQuizAttempts++;

    if (answer.isCorrect) {
      correctQuizAnswers++;
      totalXpEarned += answer.xpEarned;
    }

    // Update average score
    final totalScore =
        averageScore * (totalQuizAttempts - 1) + (answer.isCorrect ? 100 : 0);
    averageScore = totalScore / totalQuizAttempts;

    // Update best score
    if (answer.isCorrect && answer.score > bestScore) {
      bestScore = answer.score;
    }

    lastAccessedAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  void addTimeSpent(int minutes) {
    totalTimeSpentMinutes += minutes;
    lastAccessedAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    updatedAt = DateTime.now();
  }

  void incrementStreak() {
    streakCount++;
    updatedAt = DateTime.now();
  }

  void resetStreak() {
    streakCount = 0;
    updatedAt = DateTime.now();
  }
}

@embedded
class QuizAnswer {
  late int quizId;

  late int selectedAnswerIndex;

  late bool isCorrect;

  late double timeSpent; // in seconds

  late int xpEarned;

  late double score; // 0-100

  DateTime answeredAt = DateTime.now();

  String? explanation;

  // Computed properties
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
}
