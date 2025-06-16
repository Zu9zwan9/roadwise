import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:roadwise/start_lesson_usecase.dart';
import 'package:roadwise/toggle_lesson_favorite_usecase.dart';

import '../complete_lesson_usecase.dart';
import '../download_lesson_usecase.dart';
import '../get_lesson_detail_usecase.dart';
import '../get_lesson_topics_usecase.dart';
import '../get_lessons_usecase.dart';
import '../lesson_event.dart';
import '../lesson_state.dart';
import '../search_lessons_usecase.dart';

@injectable
class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final GetLessonsUseCase _getLessonsUseCase;
  final GetLessonDetailUseCase _getLessonDetailUseCase;
  final GetLessonTopicsUseCase _getLessonTopicsUseCase;
  final StartLessonUseCase _startLessonUseCase;
  final CompleteLessonUseCase _completeLessonUseCase;
  final ToggleLessonFavoriteUseCase _toggleLessonFavoriteUseCase;
  final DownloadLessonUseCase _downloadLessonUseCase;
  final SearchLessonsUseCase _searchLessonsUseCase;

  LessonBloc(
    this._getLessonsUseCase,
    this._getLessonDetailUseCase,
    this._getLessonTopicsUseCase,
    this._startLessonUseCase,
    this._completeLessonUseCase,
    this._toggleLessonFavoriteUseCase,
    this._downloadLessonUseCase,
    this._searchLessonsUseCase,
  ) : super(LessonInitial()) {
    on<LessonLoadRequested>(_onLessonLoadRequested);
    on<LessonDetailLoadRequested>(_onLessonDetailLoadRequested);
    on<LessonTopicsLoadRequested>(_onLessonTopicsLoadRequested);
    on<LessonStartRequested>(_onLessonStartRequested);
    on<LessonCompleteRequested>(_onLessonCompleteRequested);
    on<LessonFavoriteToggleRequested>(_onLessonFavoriteToggleRequested);
    on<LessonDownloadRequested>(_onLessonDownloadRequested);
    on<LessonSearchRequested>(_onLessonSearchRequested);
    on<LessonFilterRequested>(_onLessonFilterRequested);
    on<LessonCategoriesLoadRequested>(_onLessonCategoriesLoadRequested);
  }

  Future<void> _onLessonLoadRequested(
    LessonLoadRequested event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());

    final result = await _getLessonsUseCase(
      GetLessonsParams(
        category: event.category,
        searchQuery: event.searchQuery,
        isPremiumOnly: event.isPremiumOnly,
      ),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (data) => emit(
        LessonLoaded(
          lessons: data.lessons,
          categories: data.categories,
          selectedCategory: event.category,
          searchQuery: event.searchQuery,
        ),
      ),
    );
  }

  Future<void> _onLessonDetailLoadRequested(
    LessonDetailLoadRequested event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());

    final result = await _getLessonDetailUseCase(
      GetLessonDetailParams(lessonId: event.lessonId),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (data) => emit(
        LessonDetailLoaded(
          lesson: data.lesson,
          topics: data.topics,
          isStarted: data.isStarted,
          progress: data.progress,
        ),
      ),
    );
  }

  Future<void> _onLessonTopicsLoadRequested(
    LessonTopicsLoadRequested event,
    Emitter<LessonState> emit,
  ) async {
    final result = await _getLessonTopicsUseCase(
      GetLessonTopicsParams(lessonId: event.lessonId),
    );

    result.fold((failure) => emit(LessonError(message: failure.message)), (
      topics,
    ) {
      // Handle topics loaded - this might be used in combination with other states
    });
  }

  Future<void> _onLessonStartRequested(
    LessonStartRequested event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());

    final result = await _startLessonUseCase(
      StartLessonParams(lessonId: event.lessonId, userId: event.userId),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (data) => emit(
        LessonStarted(
          lesson: data.lesson,
          currentTopic: data.currentTopic,
          currentTopicIndex: data.currentTopicIndex,
          totalTopics: data.totalTopics,
        ),
      ),
    );
  }

  Future<void> _onLessonCompleteRequested(
    LessonCompleteRequested event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());

    final result = await _completeLessonUseCase(
      CompleteLessonParams(
        lessonId: event.lessonId,
        userId: event.userId,
        xpEarned: event.xpEarned,
        score: event.score,
      ),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (data) => emit(
        LessonCompleted(
          lesson: data.lesson,
          xpEarned: data.xpEarned,
          score: data.score,
          badgesEarned: data.badgesEarned,
          leveledUp: data.leveledUp,
          newLevel: data.newLevel,
        ),
      ),
    );
  }

  Future<void> _onLessonFavoriteToggleRequested(
    LessonFavoriteToggleRequested event,
    Emitter<LessonState> emit,
  ) async {
    final result = await _toggleLessonFavoriteUseCase(
      ToggleLessonFavoriteParams(
        lessonId: event.lessonId,
        userId: event.userId,
      ),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (isFavorite) => emit(
        LessonFavoriteToggled(lessonId: event.lessonId, isFavorite: isFavorite),
      ),
    );
  }

  Future<void> _onLessonDownloadRequested(
    LessonDownloadRequested event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonDownloading(lessonId: event.lessonId, progress: 0.0));

    final result = await _downloadLessonUseCase(
      DownloadLessonParams(
        lessonId: event.lessonId,
        onProgress: (progress) {
          emit(LessonDownloading(lessonId: event.lessonId, progress: progress));
        },
      ),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (_) => emit(
        LessonDownloaded(
          lessonId: event.lessonId,
          message: 'Lesson downloaded successfully for offline use',
        ),
      ),
    );
  }

  Future<void> _onLessonSearchRequested(
    LessonSearchRequested event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());

    final result = await _searchLessonsUseCase(
      SearchLessonsParams(query: event.query),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (data) => emit(
        LessonLoaded(
          lessons: data.lessons,
          categories: data.categories,
          searchQuery: event.query,
        ),
      ),
    );
  }

  Future<void> _onLessonFilterRequested(
    LessonFilterRequested event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());

    final result = await _getLessonsUseCase(
      GetLessonsParams(
        category: event.category,
        difficulty: event.difficulty,
        isPremiumOnly: event.isPremium ?? false,
        isCompleted: event.isCompleted,
      ),
    );

    result.fold(
      (failure) => emit(LessonError(message: failure.message)),
      (data) => emit(
        LessonLoaded(
          lessons: data.lessons,
          categories: data.categories,
          selectedCategory: event.category,
        ),
      ),
    );
  }

  Future<void> _onLessonCategoriesLoadRequested(
    LessonCategoriesLoadRequested event,
    Emitter<LessonState> emit,
  ) async {
    // This event is intended to load or refresh categories.
    // We use _getLessonsUseCase, assuming it's the source for categories.
    // Default GetLessonsParams() should fetch all lessons and categories.
    final result = await _getLessonsUseCase(const GetLessonsParams());

    result.fold((failure) => emit(LessonError(message: failure.message)), (
      newData,
    ) {
      final currentState = state;
      if (currentState is LessonLoaded) {
        // If lessons and potentially categories are already loaded,
        // preserve existing lessons, selectedCategory, and searchQuery.
        // Update only the categories list from the newData.
        emit(
          LessonLoaded(
            lessons: currentState.lessons,
            categories: newData.categories,
            selectedCategory: currentState.selectedCategory,
            searchQuery: currentState.searchQuery,
          ),
        );
      } else {
        // If the current state is not LessonLoaded (e.g., Initial, Loading, or Error),
        // emit a new LessonLoaded state using data from this fetch.
        emit(
          LessonLoaded(
            lessons: newData.lessons,
            categories: newData.categories,
          ),
        );
      }
    });
  }
}
