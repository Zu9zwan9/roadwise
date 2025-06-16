import 'package:equatable/equatable.dart';

class LeaderboardEntryEntity extends Equatable {
  final int id;
  final int userId;
  final String userName;
  final String? userAvatarUrl;
  final int score;
  final int xp;
  final int level;
  final int streak;
  final int lessonsCompleted;
  final int quizzesCompleted;
  final double averageAccuracy;
  final int totalStudyTimeMinutes;
  final int rank;
  final int previousRank;
  final String leaderboardType;
  final String period;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;

  const LeaderboardEntryEntity({
    required this.id,
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.score,
    required this.xp,
    required this.level,
    required this.streak,
    required this.lessonsCompleted,
    required this.quizzesCompleted,
    required this.averageAccuracy,
    required this.totalStudyTimeMinutes,
    required this.rank,
    required this.previousRank,
    required this.leaderboardType,
    required this.period,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  int get rankChange => previousRank > 0 ? previousRank - rank : 0;
  bool get rankImproved => rankChange > 0;
  bool get rankDeclined => rankChange < 0;
  bool get rankUnchanged => rankChange == 0 && previousRank > 0;

  String get rankChangeText {
    if (rankChange > 0) {
      return '+$rankChange';
    } else if (rankChange < 0) {
      return '$rankChange';
    } else {
      return '—';
    }
  }

  String get accuracyText => '${(averageAccuracy * 100).toInt()}%';

  String get studyTimeText {
    if (totalStudyTimeMinutes < 60) {
      return '${totalStudyTimeMinutes}m';
    } else {
      final hours = totalStudyTimeMinutes ~/ 60;
      final minutes = totalStudyTimeMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
    }
  }

  String get leaderboardTypeText {
    switch (leaderboardType) {
      case 'global':
        return 'Global';
      case 'friends':
        return 'Friends';
      case 'weekly':
        return 'Weekly';
      case 'monthly':
        return 'Monthly';
      default:
        return 'Unknown';
    }
  }

  String get periodText {
    switch (period) {
      case 'all_time':
        return 'All Time';
      case 'weekly':
        return 'This Week';
      case 'monthly':
        return 'This Month';
      case 'daily':
        return 'Today';
      default:
        return 'Unknown';
    }
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        userName,
        userAvatarUrl,
        score,
        xp,
        level,
        streak,
        lessonsCompleted,
        quizzesCompleted,
        averageAccuracy,
        totalStudyTimeMinutes,
        rank,
        previousRank,
        leaderboardType,
        period,
        date,
        createdAt,
        updatedAt,
      ];
}

