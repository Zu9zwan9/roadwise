import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, UserEntity>> getUserById(int id);
  Future<Either<Failure, UserEntity>> getUserByEmail(String email);
  Future<Either<Failure, UserEntity>> createUser(UserEntity user);
  Future<Either<Failure, UserEntity>> updateUser(UserEntity user);
  Future<Either<Failure, void>> deleteUser(int id);
  Future<Either<Failure, void>> addXP(int userId, int xp);
  Future<Either<Failure, void>> updateStreak(int userId);
  Future<Either<Failure, void>> addBadge(int userId, String badgeId);
  Future<Either<Failure, void>> addAchievement(int userId, String achievementId);
  Future<Either<Failure, void>> consumeLife(int userId);
  Future<Either<Failure, void>> regenerateLife(int userId);
  Future<Either<Failure, Map<String, dynamic>>> getUserStats(int userId);
}

