import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:roadwise/topic_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_entity.dart';
import 'lesson_repository.dart';

@injectable
class StartLessonUseCase
    implements UseCase<StartLessonResult, StartLessonParams> {
  final LessonRepository repository;

  StartLessonUseCase(this.repository);

  @override
  Future<Either<Failure, StartLessonResult>> call(
    StartLessonParams params,
  ) async {
    final result = await repository.startLesson(
      lessonId: params.lessonId,
      userId: params.userId,
    );

    return result.fold((failure) => Left(failure), (data) => Right(data));
  }
}

class StartLessonParams extends Equatable {
  final int lessonId;
  final int userId;

  const StartLessonParams({required this.lessonId, required this.userId});

  @override
  List<Object> get props => [lessonId, userId];
}

class StartLessonResult extends Equatable {
  final LessonEntity lesson;
  final TopicEntity currentTopic;
  final int currentTopicIndex;
  final int totalTopics;

  const StartLessonResult({
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
