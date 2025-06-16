import 'package:equatable/equatable.dart';

class TopicEntity extends Equatable {
  final int id;
  final int lessonId;
  final String name;
  final String content;
  final int difficulty;
  final int orderIndex;
  final String? imageUrl;
  final String? videoUrl;
  final String? audioUrl;
  final List<String> keyPoints;
  final List<String> examples;
  final List<String> tips;
  final int estimatedReadingTimeMinutes;
  final bool isActive;
  final bool isPremium;
  final List<String> relatedTopicIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TopicEntity({
    required this.id,
    required this.lessonId,
    required this.name,
    required this.content,
    required this.difficulty,
    required this.orderIndex,
    this.imageUrl,
    this.videoUrl,
    this.audioUrl,
    required this.keyPoints,
    required this.examples,
    required this.tips,
    required this.estimatedReadingTimeMinutes,
    required this.isActive,
    required this.isPremium,
    required this.relatedTopicIds,
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

  bool get hasMedia => imageUrl != null || videoUrl != null || audioUrl != null;
  bool get hasVideo => videoUrl != null && videoUrl!.isNotEmpty;
  bool get hasAudio => audioUrl != null && audioUrl!.isNotEmpty;
  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;
  bool get hasKeyPoints => keyPoints.isNotEmpty;
  bool get hasExamples => examples.isNotEmpty;
  bool get hasTips => tips.isNotEmpty;
  bool get hasRelatedTopics => relatedTopicIds.isNotEmpty;

  String get readingTimeText {
    if (estimatedReadingTimeMinutes < 1) {
      return '< 1 min';
    } else if (estimatedReadingTimeMinutes < 60) {
      return '$estimatedReadingTimeMinutes min';
    } else {
      final hours = estimatedReadingTimeMinutes ~/ 60;
      final minutes = estimatedReadingTimeMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
    }
  }

  @override
  List<Object?> get props => [
        id,
        lessonId,
        name,
        content,
        difficulty,
        orderIndex,
        imageUrl,
        videoUrl,
        audioUrl,
        keyPoints,
        examples,
        tips,
        estimatedReadingTimeMinutes,
        isActive,
        isPremium,
        relatedTopicIds,
        createdAt,
        updatedAt,
      ];
}

