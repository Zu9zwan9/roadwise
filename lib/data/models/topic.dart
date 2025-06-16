import 'package:isar/isar.dart';

part 'topic.g.dart';

@collection
class Topic {
  Id id = Isar.autoIncrement;

  late int lessonId;

  late String name;

  late String description;

  int difficulty = 1; // 1-4 (Beginner, Intermediate, Advanced, Expert)

  String? imageUrl;

  String? content;

  int orderIndex = 0;

  bool isActive = true;

  bool isPremium = false;

  int estimatedDurationMinutes = 0;

  List<String> tags = [];

  int totalQuestions = 0;

  double averageRating = 0;

  int totalRatings = 0;

  int completionCount = 0;

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

  String get estimatedDurationText {
    if (estimatedDurationMinutes < 60) {
      return '${estimatedDurationMinutes}m';
    } else {
      final hours = estimatedDurationMinutes ~/ 60;
      final minutes = estimatedDurationMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
    }
  }

  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;

  bool get hasContent => content != null && content!.isNotEmpty;

  // Methods
  void updateRating(double newRating) {
    final totalScore = averageRating * totalRatings + newRating;
    totalRatings++;
    averageRating = totalScore / totalRatings;
    updatedAt = DateTime.now();
  }

  void incrementCompletion() {
    completionCount++;
    updatedAt = DateTime.now();
  }
}
