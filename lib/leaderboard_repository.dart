import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import 'leaderboard_entry_entity.dart';

abstract class LeaderboardRepository {
  Future<Either<Failure, List<LeaderboardEntryEntity>>> getGlobalLeaderboard({
    String period = 'all_time',
    int limit = 100,
  });

  Future<Either<Failure, List<LeaderboardEntryEntity>>> getFriendsLeaderboard({
    required int userId,
    String period = 'all_time',
    int limit = 100,
  });

  Future<Either<Failure, List<LeaderboardEntryEntity>>> getWeeklyLeaderboard({
    int limit = 100,
  });

  Future<Either<Failure, List<LeaderboardEntryEntity>>> getMonthlyLeaderboard({
    int limit = 100,
  });

  Future<Either<Failure, LeaderboardEntryEntity?>> getUserRank({
    required int userId,
    String type = 'global',
    String period = 'all_time',
  });

  Future<Either<Failure, void>> updateUserStats({
    required int userId,
    required int xp,
    required int level,
    required int streak,
    required int lessonsCompleted,
    required int quizzesCompleted,
    required double averageAccuracy,
    required int totalStudyTimeMinutes,
  });

  Future<Either<Failure, List<LeaderboardEntryEntity>>> searchUsers(
    String query,
  );

  Future<Either<Failure, void>> addFriend(int userId, int friendId);

  Future<Either<Failure, void>> removeFriend(int userId, int friendId);

  Future<Either<Failure, List<LeaderboardEntryEntity>>> getFriends(int userId);
}
