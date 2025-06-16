import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'lesson_entity.dart';
import 'lesson_repository.dart';

@injectable
class SearchLessonsUseCase
    implements UseCase<SearchLessonsResult, SearchLessonsParams> {
  final LessonRepository repository;

  SearchLessonsUseCase(this.repository);

  @override
  Future<Either<Failure, SearchLessonsResult>> call(
    SearchLessonsParams params,
  ) async {
    final lessonsResult = await repository.searchLessons(params.query);

    return lessonsResult.fold((failure) => Left(failure), (lessons) async {
      final categoriesResult = await repository.getCategories();
      return categoriesResult.fold(
        (failure) => Left(failure),
        (categories) => Right(
          SearchLessonsResult(lessons: lessons, categories: categories),
        ),
      );
    });
  }
}

class SearchLessonsParams extends Equatable {
  final String query;

  const SearchLessonsParams({required this.query});

  @override
  List<Object> get props => [query];
}

class SearchLessonsResult extends Equatable {
  final List<LessonEntity> lessons;
  final List<String> categories;

  const SearchLessonsResult({required this.lessons, required this.categories});

  @override
  List<Object> get props => [lessons, categories];
}
