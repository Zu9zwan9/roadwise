import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    String? username,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, void>> resetPassword({required String email});

  Future<Either<Failure, UserEntity>> updateProfile({
    required int userId,
    String? name,
    String? username,
    String? profileImageUrl,
  });

  Future<Either<Failure, void>> changePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, void>> deleteAccount({
    required int userId,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithApple();

  Future<Either<Failure, void>> verifyEmail({required String token});

  Future<Either<Failure, bool>> isEmailVerified();

  Future<Either<Failure, void>> resendVerificationEmail();
}
