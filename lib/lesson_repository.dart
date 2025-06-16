import 'package:dartz/dartz.dart';
import 'package:roadwise/complete_lesson_usecase.dart';
import 'package:roadwise/lesson_entity.dart';
import 'package:roadwise/start_lesson_usecase.dart';
import 'package:roadwise/topic_entity.dart';
import 'package:roadwise/user_progress_entity.dart';

import '../../core/errors/failures.dart';

abstract class LessonRepository {
  Future<Either<Failure, List<LessonEntity>>> getAllLessons();
  Future<Either<Failure, List<LessonEntity>>> getLessonsByCategory(
    String category,
  );
  Future<Either<Failure, LessonEntity>> getLessonById(int id);
  Future<Either<Failure, List<LessonEntity>>> searchLessons(String query);
  Future<Either<Failure, List<LessonEntity>>> getFeaturedLessons();
  Future<Either<Failure, List<LessonEntity>>> getRecommendedLessons(int userId);
  Future<Either<Failure, List<TopicEntity>>> getLessonTopics(int lessonId);
  Future<Either<Failure, void>> rateLesson(int lessonId, double rating);
  Future<Either<Failure, void>> markLessonCompleted(int lessonId, int userId);
  Future<Either<Failure, List<String>>> getLessonCategories();
  // New methods
  Future<Either<Failure, List<LessonEntity>>> getLessons({
    String? category,
    String? searchQuery,
    int? difficulty,
    bool isPremiumOnly,
    bool? isCompleted,
  });
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, void>> downloadLesson({
    required int lessonId,
    Function(double)? onProgress,
  });
  Future<Either<Failure, CompleteLessonResult>> completeLesson({
    required int lessonId,
    required int userId,
    required int xpEarned,
    required double score,
  });
  Future<Either<Failure, StartLessonResult>> startLesson({
    required int lessonId,
    required int userId,
  });
  Future<Either<Failure, bool>> toggleFavorite({
    required int lessonId,
    required int userId,
  });
  Future<Either<Failure, UserProgressEntity>> getUserProgress(
    int userId,
    int lessonId,
  );
}
