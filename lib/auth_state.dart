import 'package:equatable/equatable.dart';
import '../../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthSignUpSuccess extends AuthState {
  final String message;

  const AuthSignUpSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthPasswordResetSent extends AuthState {
  final String email;

  const AuthPasswordResetSent({required this.email});

  @override
  List<Object> get props => [email];
}

class AuthProfileUpdated extends AuthState {
  final UserEntity user;

  const AuthProfileUpdated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthPasswordChanged extends AuthState {
  final String message;

  const AuthPasswordChanged({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthAccountDeleted extends AuthState {
  final String message;

  const AuthAccountDeleted({required this.message});

  @override
  List<Object> get props => [message];
}

