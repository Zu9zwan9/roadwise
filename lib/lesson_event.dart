import 'package:equatable/equatable.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object?> get props => [];
}

class LessonLoadRequested extends LessonEvent {
  final String? category;
  final String? searchQuery;
  final bool isPremiumOnly;

  const LessonLoadRequested({
    this.category,
    this.searchQuery,
    this.isPremiumOnly = false,
  });

  @override
  List<Object?> get props => [category, searchQuery, isPremiumOnly];
}

class LessonCategoriesLoadRequested extends LessonEvent {}

class LessonDetailLoadRequested extends LessonEvent {
  final int lessonId;

  const LessonDetailLoadRequested({required this.lessonId});

  @override
  List<Object> get props => [lessonId];
}

class LessonTopicsLoadRequested extends LessonEvent {
  final int lessonId;

  const LessonTopicsLoadRequested({required this.lessonId});

  @override
  List<Object> get props => [lessonId];
}

class LessonStartRequested extends LessonEvent {
  final int lessonId;
  final int userId;

  const LessonStartRequested({required this.lessonId, required this.userId});

  @override
  List<Object> get props => [lessonId, userId];
}

class LessonCompleteRequested extends LessonEvent {
  final int lessonId;
  final int userId;
  final int xpEarned;
  final double score;

  const LessonCompleteRequested({
    required this.lessonId,
    required this.userId,
    required this.xpEarned,
    required this.score,
  });

  @override
  List<Object> get props => [lessonId, userId, xpEarned, score];
}

class LessonFavoriteToggleRequested extends LessonEvent {
  final int lessonId;
  final int userId;

  const LessonFavoriteToggleRequested({
    required this.lessonId,
    required this.userId,
  });

  @override
  List<Object> get props => [lessonId, userId];
}

class LessonDownloadRequested extends LessonEvent {
  final int lessonId;

  const LessonDownloadRequested({required this.lessonId});

  @override
  List<Object> get props => [lessonId];
}

class LessonSearchRequested extends LessonEvent {
  final String query;

  const LessonSearchRequested({required this.query});

  @override
  List<Object> get props => [query];
}

class LessonFilterRequested extends LessonEvent {
  final String? category;
  final int? difficulty;
  final bool? isPremium;
  final bool? isCompleted;

  const LessonFilterRequested({
    this.category,
    this.difficulty,
    this.isPremium,
    this.isCompleted,
  });

  @override
  List<Object?> get props => [category, difficulty, isPremium, isCompleted];
}
