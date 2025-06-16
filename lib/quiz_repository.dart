import 'package:dartz/dartz.dart';
import 'package:roadwise/quiz_entity.dart';

import '../../core/errors/failures.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<QuizEntity>>> getQuizzesByTopic(int topicId);
  Future<Either<Failure, QuizEntity>> getQuizById(int id);
  Future<Either<Failure, List<QuizEntity>>> getRandomQuizzes(
    int count, {
    int? difficulty,
  });
  Future<Either<Failure, List<QuizEntity>>> getQuizzesByDifficulty(
    int difficulty,
  );
  Future<Either<Failure, void>> submitQuizAnswer({
    required int quizId,
    required int userId,
    required int selectedAnswerIndex,
    required double timeSpent,
  });
  Future<Either<Failure, Map<String, dynamic>>> getQuizResults({
    required int userId,
    required List<int> quizIds,
  });
  Future<Either<Failure, List<QuizEntity>>> getPracticeQuizzes(int userId);
  Future<Either<Failure, void>> recordQuizAttempt({
    required int quizId,
    required bool isCorrect,
    required double timeSpent,
  });
}
