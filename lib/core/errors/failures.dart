import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

// Specific app failures
class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure() : super('User not found');
}

class LessonNotFoundFailure extends Failure {
  const LessonNotFoundFailure() : super('Lesson not found');
}

class QuizNotFoundFailure extends Failure {
  const QuizNotFoundFailure() : super('Quiz not found');
}

class SubscriptionFailure extends Failure {
  const SubscriptionFailure(super.message);
}

class OfflineDataFailure extends Failure {
  const OfflineDataFailure(super.message);
}

class SyncFailure extends Failure {
  const SyncFailure(super.message);
}
