import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:roadwise/complete_lesson_usecase.dart';
import 'package:roadwise/start_lesson_usecase.dart';
import 'package:roadwise/user_progress_entity.dart';

import '../../core/errors/failures.dart';
import '../../data/models/database_service.dart';
import '../../lesson_entity.dart';
import '../../lesson_repository.dart';
import '../../topic_entity.dart';

@LazySingleton(as: LessonRepository)
class LessonRepositoryImpl implements LessonRepository {
  final DatabaseService _db;
  LessonRepositoryImpl(this._db);

  @override
  Future<Either<Failure, List<LessonEntity>>> getAllLessons() async =>
      throw UnimplementedError();
  @override
  Future<Either<Failure, List<LessonEntity>>> getLessonsByCategory(
    String category,
  ) async => throw UnimplementedError();
  @override
  Future<Either<Failure, LessonEntity>> getLessonById(int id) async =>
      throw UnimplementedError();
  @override
  Future<Either<Failure, List<TopicEntity>>> getLessonTopics(
    int lessonId,
  ) async => throw UnimplementedError();
  @override
  Future<Either<Failure, List<LessonEntity>>> searchLessons(
    String query,
  ) async => throw UnimplementedError();
  @override
  Future<Either<Failure, List<LessonEntity>>> getFeaturedLessons() async =>
      throw UnimplementedError();
  @override
  Future<Either<Failure, List<LessonEntity>>> getRecommendedLessons(
    int userId,
  ) async => throw UnimplementedError();
  @override
  Future<Either<Failure, void>> rateLesson(int lessonId, double rating) async =>
      throw UnimplementedError();
  @override
  Future<Either<Failure, bool>> toggleFavorite({
    required int lessonId,
    required int userId,
  }) async => throw UnimplementedError();
  @override
  Future<Either<Failure, void>> downloadLesson({
    required int lessonId,
    Function(double)? onProgress,
  }) async => throw UnimplementedError();
  @override
  Future<Either<Failure, CompleteLessonResult>> completeLesson({
    required int lessonId,
    required int userId,
    required int xpEarned,
    required double score,
  }) async => throw UnimplementedError();
  @override
  Future<Either<Failure, List<String>>> getCategories() async =>
      throw UnimplementedError();
  @override
  Future<Either<Failure, List<String>>> getLessonCategories() async =>
      throw UnimplementedError();
  @override
  Future<Either<Failure, List<LessonEntity>>> getLessons({
    String? category,
    String? searchQuery,
    int? difficulty,
    bool isPremiumOnly =
        false, // Default value as per typical usage, adjust if needed
    bool? isCompleted,
  }) async => throw UnimplementedError();
  @override
  Future<Either<Failure, UserProgressEntity>> getUserProgress(
    int userId,
    int lessonId,
  ) async => throw UnimplementedError();
  @override
  Future<Either<Failure, void>> markLessonCompleted(
    int lessonId,
    int userId,
  ) async => throw UnimplementedError();
  @override
  Future<Either<Failure, StartLessonResult>> startLesson({
    required int lessonId,
    required int userId,
  }) async => throw UnimplementedError();
}
