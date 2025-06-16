import 'package:isar/isar.dart';

part 'quiz.g.dart';

@collection
class Quiz {
  Id id = Isar.autoIncrement;

  late int topicId;

  late String question;

  late List<String> options;

  late int correctAnswerIndex;

  String? explanation;

  String? imageUrl;

  String? audioUrl;

  int difficulty = 1; // 1-4 (Beginner, Intermediate, Advanced, Expert)

  int orderIndex = 0;

  int points = 10; // XP points for correct answer

  int timeLimit = 30; // Time limit in seconds

  bool isActive = true;

  bool isPremium = false;

  List<String> tags = [];

  int totalAttempts = 0;

  int correctAttempts = 0;

  double averageTimeSpent = 0;

  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();

  // Computed properties
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

  double get successRate =>
      totalAttempts > 0 ? correctAttempts / totalAttempts : 0.0;

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

  // Methods
  bool isCorrectAnswer(int selectedIndex) {
    return selectedIndex == correctAnswerIndex;
  }

  void recordAttempt(bool isCorrect, double timeSpent) {
    totalAttempts++;
    if (isCorrect) {
      correctAttempts++;
    }

    // Update average time spent
    averageTimeSpent =
        ((averageTimeSpent * (totalAttempts - 1)) + timeSpent) / totalAttempts;

    updatedAt = DateTime.now();
  }

  int getPointsForAnswer(bool isCorrect, double timeSpent) {
    if (!isCorrect) return 0;

    // Base points
    int earnedPoints = points;

    // Time bonus (if answered quickly)
    if (timeSpent < timeLimit * 0.5) {
      earnedPoints = (earnedPoints * 1.5).round();
    } else if (timeSpent < timeLimit * 0.75) {
      earnedPoints = (earnedPoints * 1.2).round();
    }

    // Difficulty bonus
    earnedPoints = (earnedPoints * difficulty * 0.5).round();

    return earnedPoints;
  }
}
