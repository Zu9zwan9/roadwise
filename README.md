# RoadWise

A gamified, Duolingo-style mobile app for learning road signs and traffic rules. Short lessons, quick quizzes, streaks and a leaderboard, so studying for a driving test feels like a game instead of a manual.

Built with Flutter for iOS and Android.

## Features

- Bite-size lessons by topic, each followed by a quiz
- Progress, streaks and XP, with confetti and Lottie animations on milestones
- Leaderboard
- Offline lesson packages for studying without a connection
- In-app purchase for premium content
- Local reminders to keep a streak alive

## Architecture

Clean architecture with three layers:

- `domain`: entities, repository contracts and use cases such as `CompleteLessonUseCase`
- `data`: models (Isar), repository implementations, network access with Dio
- `presentation`: BLoC state management (`AuthBloc`, `LessonBloc`) and go_router navigation

Dependencies are wired with get_it and injectable. Errors flow as `Either<Failure, T>` from dartz, so the UI never catches raw exceptions.

## Run it

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # Isar and injectable codegen
flutter run
```

## Tests

```bash
flutter test
```
