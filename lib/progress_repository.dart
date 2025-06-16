import 'package:dartz/dartz.dart';
import 'package:roadwise/user_progress_entity.dart';

import '../../core/errors/failures.dart';

abstract class ProgressRepository {
  Future<Either<Failure, UserProgressEntity>> getUserProgress(
    int userId,
    int lessonId,
  );
  Future<Either<Failure, List<UserProgressEntity>>> getUserProgressList(
    int userId,
  );
  Future<Either<Failure, UserProgressEntity>> createUserProgress(
    UserProgressEntity progress,
  );
  Future<Either<Failure, UserProgressEntity>> updateUserProgress(
    UserProgressEntity progress,
  );
  Future<Either<Failure, void>> markTopicCompleted(
    int userId,
    int lessonId,
    int topicId,
  );
  Future<Either<Failure, void>> markLessonCompleted(int userId, int lessonId);
  Future<Either<Failure, void>> updateProgress(
    int userId,
    int lessonId,
    double progress,
  );
  Future<Either<Failure, void>> addStudyTime(
    int userId,
    int lessonId,
    int minutes,
  );
  Future<Either<Failure, void>> toggleFavorite(int userId, int lessonId);
  Future<Either<Failure, List<UserProgressEntity>>> getFavoriteProgress(
    int userId,
  );
  Future<Either<Failure, List<UserProgressEntity>>> getRecentProgress(
    int userId, {
    int limit = 10,
  });
  Future<Either<Failure, Map<String, dynamic>>> getProgressStats(int userId);
}
