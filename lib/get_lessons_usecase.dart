import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_entity.dart';
import 'lesson_repository.dart';

@injectable
class GetLessonsUseCase implements UseCase<GetLessonsResult, GetLessonsParams> {
  final LessonRepository repository;

  GetLessonsUseCase(this.repository);

  @override
  Future<Either<Failure, GetLessonsResult>> call(
    GetLessonsParams params,
  ) async {
    final lessonsResult = await repository.getLessons(
      category: params.category,
      searchQuery: params.searchQuery,
      difficulty: params.difficulty,
      isPremiumOnly: params.isPremiumOnly,
      isCompleted: params.isCompleted,
    );

    return lessonsResult.fold((failure) => Left(failure), (lessons) async {
      final categoriesResult = await repository.getCategories();
      return categoriesResult.fold(
        (failure) => Left(failure),
        (categories) =>
            Right(GetLessonsResult(lessons: lessons, categories: categories)),
      );
    });
  }
}

class GetLessonsParams extends Equatable {
  final String? category;
  final String? searchQuery;
  final int? difficulty;
  final bool isPremiumOnly;
  final bool? isCompleted;

  const GetLessonsParams({
    this.category,
    this.searchQuery,
    this.difficulty,
    this.isPremiumOnly = false,
    this.isCompleted,
  });

  @override
  List<Object?> get props => [
    category,
    searchQuery,
    difficulty,
    isPremiumOnly,
    isCompleted,
  ];
}

class GetLessonsResult extends Equatable {
  final List<LessonEntity> lessons;
  final List<String> categories;

  const GetLessonsResult({required this.lessons, required this.categories});

  @override
  List<Object> get props => [lessons, categories];
}
