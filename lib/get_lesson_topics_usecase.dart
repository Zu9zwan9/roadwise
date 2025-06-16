import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:roadwise/topic_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_repository.dart';

@injectable
class GetLessonTopicsUseCase
    implements UseCase<List<TopicEntity>, GetLessonTopicsParams> {
  final LessonRepository repository;

  GetLessonTopicsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TopicEntity>>> call(
    GetLessonTopicsParams params,
  ) async {
    return await repository.getLessonTopics(params.lessonId);
  }
}

class GetLessonTopicsParams extends Equatable {
  final int lessonId;

  const GetLessonTopicsParams({required this.lessonId});

  @override
  List<Object> get props => [lessonId];
}
