import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_repository.dart';

@injectable
class ToggleLessonFavoriteUseCase
    implements UseCase<bool, ToggleLessonFavoriteParams> {
  final LessonRepository repository;

  ToggleLessonFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ToggleLessonFavoriteParams params) async {
    return await repository.toggleFavorite(
      lessonId: params.lessonId,
      userId: params.userId,
    );
  }
}

class ToggleLessonFavoriteParams extends Equatable {
  final int lessonId;
  final int userId;

  const ToggleLessonFavoriteParams({
    required this.lessonId,
    required this.userId,
  });

  @override
  List<Object> get props => [lessonId, userId];
}
