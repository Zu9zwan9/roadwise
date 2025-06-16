import 'package:isar/isar.dart';

part 'leaderboard_entry.g.dart';

@collection
class LeaderboardEntry {
  Id id = Isar.autoIncrement;

  late int userId;

  late String userName;

  String? userAvatarUrl;

  late int score;

  late int xp;

  late int level;

  late int streak;

  late int lessonsCompleted;

  late int quizzesCompleted;

  double averageAccuracy = 0.0;

  int totalStudyTimeMinutes = 0;

  int rank = 0;

  int previousRank = 0;

  String leaderboardType = 'global'; // 'global', 'friends', 'weekly', 'monthly'

  String period = 'all_time'; // 'all_time', 'weekly', 'monthly', 'daily'

  DateTime date = DateTime.now();

  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();

  // Computed properties
  @ignore
  int get rankChange => previousRank > 0 ? previousRank - rank : 0;

  @ignore
  bool get rankImproved => rankChange > 0;

  @ignore
  bool get rankDeclined => rankChange < 0;

  @ignore
  bool get rankUnchanged => rankChange == 0 && previousRank > 0;

  @ignore
  String get rankChangeText {
    if (rankChange > 0) {
      return '+$rankChange';
    } else if (rankChange < 0) {
      return '$rankChange';
    } else {
      return '—';
    }
  }

  @ignore
  String get accuracyText => '${(averageAccuracy * 100).toInt()}%';

  @ignore
  String get studyTimeText {
    if (totalStudyTimeMinutes < 60) {
      return '${totalStudyTimeMinutes}m';
    } else {
      final hours = totalStudyTimeMinutes ~/ 60;
      final minutes = totalStudyTimeMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
    }
  }

  @ignore
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

  @ignore
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

  // Methods
  void updateRank(int newRank) {
    previousRank = rank;
    rank = newRank;
    updatedAt = DateTime.now();
  }

  void updateScore(int newScore) {
    score = newScore;
    updatedAt = DateTime.now();
  }

  void updateStats({
    int? newXp,
    int? newLevel,
    int? newStreak,
    int? newLessonsCompleted,
    int? newQuizzesCompleted,
    double? newAverageAccuracy,
    int? newTotalStudyTimeMinutes,
  }) {
    if (newXp != null) xp = newXp;
    if (newLevel != null) level = newLevel;
    if (newStreak != null) streak = newStreak;
    if (newLessonsCompleted != null) lessonsCompleted = newLessonsCompleted;
    if (newQuizzesCompleted != null) quizzesCompleted = newQuizzesCompleted;
    if (newAverageAccuracy != null) averageAccuracy = newAverageAccuracy;
    if (newTotalStudyTimeMinutes != null) {
      totalStudyTimeMinutes = newTotalStudyTimeMinutes;
    }

    updatedAt = DateTime.now();
  }
}
