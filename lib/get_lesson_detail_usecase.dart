import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:roadwise/topic_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_entity.dart';
import 'lesson_repository.dart';

@injectable
class GetLessonDetailUseCase
    implements UseCase<GetLessonDetailResult, GetLessonDetailParams> {
  final LessonRepository repository;

  GetLessonDetailUseCase(this.repository);

  @override
  Future<Either<Failure, GetLessonDetailResult>> call(
    GetLessonDetailParams params,
  ) async {
    // Fetch lesson
    final lessonEither = await repository.getLessonById(params.lessonId);
    if (lessonEither.isLeft()) {
      return Left(lessonEither.fold((l) => l, (r) => null)!);
    }
    final lesson = lessonEither.fold((l) => null, (r) => r)!;

    // Fetch topics
    final topicsEither = await repository.getLessonTopics(params.lessonId);
    if (topicsEither.isLeft()) {
      return Left(topicsEither.fold((l) => l, (r) => null)!);
    }
    final topics = topicsEither.fold((l) => null, (r) => r)!;

    // Fetch progress if userId provided
    Either<Failure, dynamic> progressEither;
    if (params.userId != null) {
      progressEither = await repository.getUserProgress(
        params.userId!,
        params.lessonId,
      );
      if (progressEither.isLeft()) {
        return Left(progressEither.fold((l) => l, (r) => null)!);
      }
    } else {
      progressEither = const Right(null);
    }
    final progress = progressEither.fold((l) => null, (r) => r);

    return Right(
      GetLessonDetailResult(
        lesson: lesson,
        topics: topics,
        isStarted: progress != null,
        progress: progress?.progressPercentage ?? 0.0,
      ),
    );
  }
}

class GetLessonDetailParams extends Equatable {
  final int lessonId;
  final int? userId;

  const GetLessonDetailParams({required this.lessonId, this.userId});

  @override
  List<Object?> get props => [lessonId, userId];
}

class GetLessonDetailResult extends Equatable {
  final LessonEntity lesson;
  final List<TopicEntity> topics;
  final bool isStarted;
  final double progress;

  const GetLessonDetailResult({
    required this.lesson,
    required this.topics,
    required this.isStarted,
    required this.progress,
  });

  @override
  List<Object> get props => [lesson, topics, isStarted, progress];
}
