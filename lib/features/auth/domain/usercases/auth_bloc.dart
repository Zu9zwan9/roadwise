import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:roadwise/features/auth/domain/usercases/reset_password_usecase.dart';
import 'package:roadwise/features/auth/domain/usercases/sign_in_usecase.dart';
import 'package:roadwise/features/auth/domain/usercases/sign_out_usecase.dart';
import 'package:roadwise/features/auth/domain/usercases/sign_up_usecase.dart';
import 'package:roadwise/features/auth/domain/usercases/update_profile_usecase.dart';

import '../../../../auth_event.dart';
import '../../../../auth_state.dart';
import 'change_password_usecase.dart';
import 'delete_account_usecase.dart';
import 'get_current_user_usecase.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;

  AuthBloc(
    this._signInUseCase,
    this._signUpUseCase,
    this._signOutUseCase,
    this._getCurrentUserUseCase,
    this._resetPasswordUseCase,
    this._updateProfileUseCase,
    this._changePasswordUseCase,
    this._deleteAccountUseCase,
  ) : super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignUpRequested>(_onSignUpRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);
    on<AuthPasswordResetRequested>(_onPasswordResetRequested);
    on<AuthUpdateProfileRequested>(_onUpdateProfileRequested);
    on<AuthChangePasswordRequested>(_onChangePasswordRequested);
    on<AuthDeleteAccountRequested>(_onDeleteAccountRequested);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _getCurrentUserUseCase();

    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signInUseCase(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signUpUseCase(
      SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
        username: event.username,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(
        AuthSignUpSuccess(
          message: 'Account created successfully! Please verify your email.',
        ),
      ),
    );
  }

  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signOutUseCase();

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> _onPasswordResetRequested(
    AuthPasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _resetPasswordUseCase(
      ResetPasswordParams(email: event.email),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(AuthPasswordResetSent(email: event.email)),
    );
  }

  Future<void> _onUpdateProfileRequested(
    AuthUpdateProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (state is! AuthAuthenticated) return;

    emit(AuthLoading());

    final currentUser = (state as AuthAuthenticated).user;

    final result = await _updateProfileUseCase(
      UpdateProfileParams(
        userId: currentUser.id,
        name: event.name,
        username: event.username,
        profileImageUrl: event.profileImageUrl,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthProfileUpdated(user: user)),
    );
  }

  Future<void> _onChangePasswordRequested(
    AuthChangePasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (state is! AuthAuthenticated) return;

    emit(AuthLoading());

    final currentUser = (state as AuthAuthenticated).user;

    final result = await _changePasswordUseCase(
      ChangePasswordParams(
        userId: currentUser.id,
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(
        const AuthPasswordChanged(message: 'Password changed successfully!'),
      ),
    );
  }

  Future<void> _onDeleteAccountRequested(
    AuthDeleteAccountRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (state is! AuthAuthenticated) return;

    emit(AuthLoading());

    final currentUser = (state as AuthAuthenticated).user;

    final result = await _deleteAccountUseCase(
      DeleteAccountParams(userId: currentUser.id, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(
        const AuthAccountDeleted(message: 'Account deleted successfully!'),
      ),
    );
  }
}
