import 'package:equatable/equatable.dart';
import 'package:roadwise/topic_entity.dart';

import 'lesson_entity.dart';

abstract class LessonState extends Equatable {
  const LessonState();

  @override
  List<Object?> get props => [];
}

class LessonInitial extends LessonState {}

class LessonLoading extends LessonState {}

class LessonLoaded extends LessonState {
  final List<LessonEntity> lessons;
  final List<String> categories;
  final String? selectedCategory;
  final String? searchQuery;

  const LessonLoaded({
    required this.lessons,
    required this.categories,
    this.selectedCategory,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [
    lessons,
    categories,
    selectedCategory,
    searchQuery,
  ];
}

class LessonDetailLoaded extends LessonState {
  final LessonEntity lesson;
  final List<TopicEntity> topics;
  final bool isStarted;
  final double progress;

  const LessonDetailLoaded({
    required this.lesson,
    required this.topics,
    required this.isStarted,
    required this.progress,
  });

  @override
  List<Object> get props => [lesson, topics, isStarted, progress];
}

class LessonStarted extends LessonState {
  final LessonEntity lesson;
  final TopicEntity currentTopic;
  final int currentTopicIndex;
  final int totalTopics;

  const LessonStarted({
    required this.lesson,
    required this.currentTopic,
    required this.currentTopicIndex,
    required this.totalTopics,
  });

  @override
  List<Object> get props => [
    lesson,
    currentTopic,
    currentTopicIndex,
    totalTopics,
  ];
}

class LessonCompleted extends LessonState {
  final LessonEntity lesson;
  final int xpEarned;
  final double score;
  final List<String> badgesEarned;
  final bool leveledUp;
  final int newLevel;

  const LessonCompleted({
    required this.lesson,
    required this.xpEarned,
    required this.score,
    required this.badgesEarned,
    required this.leveledUp,
    required this.newLevel,
  });

  @override
  List<Object> get props => [
    lesson,
    xpEarned,
    score,
    badgesEarned,
    leveledUp,
    newLevel,
  ];
}

class LessonError extends LessonState {
  final String message;

  const LessonError({required this.message});

  @override
  List<Object> get props => [message];
}

class LessonDownloading extends LessonState {
  final int lessonId;
  final double progress;

  const LessonDownloading({required this.lessonId, required this.progress});

  @override
  List<Object> get props => [lessonId, progress];
}

class LessonDownloaded extends LessonState {
  final int lessonId;
  final String message;

  const LessonDownloaded({required this.lessonId, required this.message});

  @override
  List<Object> get props => [lessonId, message];
}

class LessonFavoriteToggled extends LessonState {
  final int lessonId;
  final bool isFavorite;

  const LessonFavoriteToggled({
    required this.lessonId,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [lessonId, isFavorite];
}
