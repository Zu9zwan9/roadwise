import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_repository.dart';

@injectable
class DownloadLessonUseCase implements UseCase<void, DownloadLessonParams> {
  final LessonRepository repository;

  DownloadLessonUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DownloadLessonParams params) async {
    return await repository.downloadLesson(
      lessonId: params.lessonId,
      onProgress: params.onProgress,
    );
  }
}

class DownloadLessonParams extends Equatable {
  final int lessonId;
  final Function(double)? onProgress;

  const DownloadLessonParams({required this.lessonId, this.onProgress});

  @override
  List<Object?> get props => [lessonId];
}
