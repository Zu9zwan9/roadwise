import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_entity.dart';
import 'lesson_repository.dart';

@injectable
class CompleteLessonUseCase
    implements UseCase<CompleteLessonResult, CompleteLessonParams> {
  final LessonRepository repository;

  CompleteLessonUseCase(this.repository);

  @override
  Future<Either<Failure, CompleteLessonResult>> call(
    CompleteLessonParams params,
  ) async {
    return await repository.completeLesson(
      lessonId: params.lessonId,
      userId: params.userId,
      xpEarned: params.xpEarned,
      score: params.score,
    );
  }
}

class CompleteLessonParams extends Equatable {
  final int lessonId;
  final int userId;
  final int xpEarned;
  final double score;

  const CompleteLessonParams({
    required this.lessonId,
    required this.userId,
    required this.xpEarned,
    required this.score,
  });

  @override
  List<Object> get props => [lessonId, userId, xpEarned, score];
}

class CompleteLessonResult extends Equatable {
  final LessonEntity lesson;
  final int xpEarned;
  final double score;
  final List<String> badgesEarned;
  final bool leveledUp;
  final int newLevel;

  const CompleteLessonResult({
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
