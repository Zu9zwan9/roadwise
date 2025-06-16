import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../../data/models/database_service.dart';
// Import the User model from data layer
import '../../data/models/user.dart' as UserModel;
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final DatabaseService _db;
  AuthRepositoryImpl(this._db);

  // Helper method to convert UserModel.User to UserEntity
  UserEntity _toUserEntity(UserModel.User userModel) {
    return UserEntity(
      id: userModel.id,
      email: userModel.email,
      name: userModel.name,
      username: userModel.username,
      profileImageUrl: userModel.profileImageUrl,
      xp: userModel.xp,
      currentStreak: userModel.currentStreak,
      longestStreak: userModel.longestStreak,
      lastActiveDate: userModel.lastActiveDate,
      lives: userModel.lives,
      lastLifeRegenTime: userModel.lastLifeRegenTime,
      badges: List<String>.from(userModel.badges), // Ensure list types match
      achievements: List<String>.from(
        userModel.achievements,
      ), // Ensure list types match
      totalLessonsCompleted: userModel.totalLessonsCompleted,
      totalQuizzesCompleted: userModel.totalQuizzesCompleted,
      averageScore: userModel.averageScore,
      totalStudyTimeMinutes: userModel.totalStudyTimeMinutes,
      subscriptionPlan: userModel.subscriptionPlan,
      subscriptionExpiryDate: userModel.subscriptionExpiryDate,
      notificationsEnabled: userModel.notificationsEnabled,
      soundEnabled: userModel.soundEnabled,
      darkModeEnabled: userModel.darkModeEnabled,
      language: userModel.language,
      createdAt: userModel.createdAt,
      updatedAt: userModel.updatedAt,
    );
  }

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _db.findUserByEmail(email);
      if (userModel == null) {
        return Left(ServerFailure('User not found.'));
      }
      final bool isPasswordValid = await _db.validatePassword(
        user: userModel, // Pass the UserModel.User object
        password: password,
      );
      if (!isPasswordValid) {
        return Left(ServerFailure('Invalid credentials.'));
      }
      await _db.setCurrentUserSession(
        userModel,
      ); // Pass the UserModel.User object
      return Right(_toUserEntity(userModel)); // Convert to UserEntity
    } catch (e) {
      return Left(ServerFailure('Sign in failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    String? username,
  }) async {
    try {
      final existingUserModel = await _db.findUserByEmail(email);
      if (existingUserModel != null) {
        return Left(ServerFailure('User with this email already exists.'));
      }
      final newUserModel = await _db.createUser(
        name: name,
        email: email,
        password: password,
        username: username,
      );
      return Right(_toUserEntity(newUserModel)); // Convert to UserEntity
    } catch (e) {
      return Left(ServerFailure('Sign up failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      // Assuming _db.clearCurrentUserSession or similar
      await _db.clearCurrentUserSession();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Sign out failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final userModel = await _db.getCurrentUser();
      if (userModel == null) {
        return Left(ServerFailure('No user currently signed in.'));
      }
      return Right(_toUserEntity(userModel)); // Convert to UserEntity
    } catch (e) {
      return Left(ServerFailure('Failed to get current user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      final userModel = await _db.findUserByEmail(email);
      if (userModel == null) {
        return const Right(null);
      }
      // Corrected call with named argument
      await _db.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Password reset failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required int userId,
    String? name,
    String? username,
    String? profileImageUrl,
  }) async {
    try {
      final updatedUserModel = await _db.updateUser(
        userId: userId,
        name: name,
        username: username,
        profileImageUrl: profileImageUrl,
      );
      if (updatedUserModel == null) {
        return Left(ServerFailure('User not found or update failed.'));
      }
      return Right(_toUserEntity(updatedUserModel)); // Convert to UserEntity
    } catch (e) {
      return Left(ServerFailure('Profile update failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      // Assuming _db.findUserById and _db.validatePassword
      final user = await _db.findUserById(userId);
      if (user == null) {
        return Left(ServerFailure('User not found.'));
      }
      final isPasswordValid = await _db.validatePassword(
        user: user,
        password: currentPassword,
      );
      if (!isPasswordValid) {
        return Left(ServerFailure('Current password is incorrect.'));
      }
      // Assuming _db.updatePassword handles hashing the new password
      await _db.updatePassword(userId: userId, newPassword: newPassword);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Change password failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount({
    required int userId,
    required String password,
  }) async {
    try {
      // Assuming _db.findUserById and _db.validatePassword
      final user = await _db.findUserById(userId);
      if (user == null) {
        return Left(ServerFailure('User not found.'));
      }
      final isPasswordValid = await _db.validatePassword(
        user: user,
        password: password,
      );
      if (!isPasswordValid) {
        return Left(ServerFailure('Invalid password.'));
      }
      // Use the new method that returns a boolean
      final bool isDeleted = await _db.deleteUserAndReturnBool(userId);
      if (!isDeleted) {
        return Left(ServerFailure('Failed to delete account.'));
      }
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Delete account failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, void>> verifyEmail({required String token}) async =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, bool>> isEmailVerified() async =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, void>> resendVerificationEmail() async =>
      throw UnimplementedError();
}
