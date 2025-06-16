import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final String? imageUrl;
  final String? iconUrl;
  final int difficulty;
  final bool isPremium;
  final int estimatedDurationMinutes;
  final int orderIndex;
  final bool isActive;
  final List<String> tags;
  final List<String> prerequisites;
  final int totalTopics;
  final int totalQuestions;
  final double averageRating;
  final int totalRatings;
  final int completionCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const LessonEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.imageUrl,
    this.iconUrl,
    required this.difficulty,
    required this.isPremium,
    required this.estimatedDurationMinutes,
    required this.orderIndex,
    required this.isActive,
    required this.tags,
    required this.prerequisites,
    required this.totalTopics,
    required this.totalQuestions,
    required this.averageRating,
    required this.totalRatings,
    required this.completionCount,
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

  String get estimatedDurationText {
    if (estimatedDurationMinutes < 60) {
      return '${estimatedDurationMinutes}m';
    } else {
      final hours = estimatedDurationMinutes ~/ 60;
      final minutes = estimatedDurationMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
    }
  }

  bool get hasPrerequisites => prerequisites.isNotEmpty;

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    imageUrl,
    iconUrl,
    difficulty,
    isPremium,
    estimatedDurationMinutes,
    orderIndex,
    isActive,
    tags,
    prerequisites,
    totalTopics,
    totalQuestions,
    averageRating,
    totalRatings,
    completionCount,
    createdAt,
    updatedAt,
  ];
}

extension LessonEntityProgress on LessonEntity {
  double get progress => 0.0;
  bool get isFavorite => false;
  bool get isDownloaded => false;
}
