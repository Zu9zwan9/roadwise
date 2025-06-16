import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:roadwise/complete_lesson_usecase.dart';
import 'package:roadwise/start_lesson_usecase.dart';
import 'package:roadwise/user_progress_entity.dart';

import '../../core/errors/failures.dart';
import '../../data/models/database_service.dart';
import '../../data/models/lesson.dart' as LessonModel;
import '../../lesson_entity.dart';
import '../../lesson_repository.dart';
import '../../topic_entity.dart';

@LazySingleton(as: LessonRepository)
class LessonRepositoryImpl implements LessonRepository {
  final DatabaseService _db;
  LessonRepositoryImpl(this._db);

  // Helper to convert LessonModel.Lesson to LessonEntity
  LessonEntity _toLessonEntity(LessonModel.Lesson model) {
    return LessonEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      category: model.category,
      imageUrl: model.imageUrl,
      iconUrl: model.iconUrl,
      difficulty: model.difficulty,
      isPremium: model.isPremium,
      estimatedDurationMinutes: model.estimatedDurationMinutes,
      orderIndex: model.orderIndex,
      isActive: model.isActive,
      tags: List<String>.from(model.tags),
      prerequisites: List<String>.from(model.prerequisites),
      totalTopics: model.totalTopics,
      totalQuestions: model.totalQuestions,
      averageRating: model.averageRating,
      totalRatings: model.totalRatings,
      completionCount: model.completionCount,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  List<LessonEntity> _toLessonEntityList(List<LessonModel.Lesson> models) {
    return models.map(_toLessonEntity).toList();
  }

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
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final lessons = await _db
          .getAllLessons(); // Assuming DatabaseService has getAllLessons
      final categories = lessons.map((e) => e.category).toSet().toList();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure('Failed to get categories: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<LessonEntity>>> getLessons({
    String? category,
    String? searchQuery,
    int? difficulty,
    bool isPremiumOnly = false,
    bool? isCompleted, // TODO: Implement filtering by completion status
  }) async {
    try {
      List<LessonModel.Lesson> lessons;
      if (searchQuery != null && searchQuery.isNotEmpty) {
        lessons = await _db.searchLessons(
          searchQuery,
        ); // Assuming DatabaseService has searchLessons
      } else if (category != null && category.isNotEmpty) {
        lessons = await _db.getLessonsByCategory(
          category,
        ); // Assuming DatabaseService has getLessonsByCategory
      } else {
        lessons = await _db.getAllLessons();
      }

      if (difficulty != null) {
        lessons = lessons
            .where((lesson) => lesson.difficulty == difficulty)
            .toList();
      }
      if (isPremiumOnly) {
        lessons = lessons.where((lesson) => lesson.isPremium).toList();
      }
      // TODO: Add filtering for isCompleted based on UserProgress

      return Right(_toLessonEntityList(lessons));
    } catch (e) {
      return Left(ServerFailure('Failed to get lessons: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getLessonCategories() async =>
      throw UnimplementedError();

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
