import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String email;

  late String password; // Added password field

  late String name;

  @Index(unique: true)
  String? username;

  String? profileImageUrl;

  int xp = 0;
  int currentStreak = 0;
  int longestStreak = 0;
  DateTime? lastActiveDate;
  int lives = 5;
  DateTime? lastLifeRegenTime;
  List<String> badges = [];
  List<String> achievements = [];
  int totalLessonsCompleted = 0;
  int totalQuizzesCompleted = 0;
  double averageScore = 0;
  int totalStudyTimeMinutes = 0;
  String subscriptionPlan = 'free';
  DateTime? subscriptionExpiryDate;
  bool notificationsEnabled = true;
  bool soundEnabled = true;
  bool darkModeEnabled = false;
  String language = 'en';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  // Computed properties
  int get level => (xp / 1000).floor() + 1;

  int get xpForCurrentLevel => xp % 1000;

  int get xpForNextLevel => 1000;

  double get progressToNextLevel => xpForCurrentLevel / xpForNextLevel;

  bool get isPremium =>
      subscriptionPlan != 'free' &&
      (subscriptionExpiryDate?.isAfter(DateTime.now()) ?? false);

  bool get hasLives => lives > 0;

  @ignore
  Duration get timeUntilNextLife {
    if (lives >= 5) return Duration.zero;
    if (lastLifeRegenTime == null) return Duration.zero;

    final nextRegenTime = lastLifeRegenTime!.add(const Duration(minutes: 30));
    final now = DateTime.now();

    if (nextRegenTime.isBefore(now)) return Duration.zero;
    return nextRegenTime.difference(now);
  }

  // Methods
  void addXP(int amount) {
    xp += amount;
    updatedAt = DateTime.now();
  }

  void addBadge(String badgeId) {
    if (!badges.contains(badgeId)) {
      badges.add(badgeId);
      updatedAt = DateTime.now();
    }
  }

  void addAchievement(String achievementId) {
    if (!achievements.contains(achievementId)) {
      achievements.add(achievementId);
      updatedAt = DateTime.now();
    }
  }

  void updateStreak() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastActive = lastActiveDate != null
        ? DateTime(
            lastActiveDate!.year,
            lastActiveDate!.month,
            lastActiveDate!.day,
          )
        : null;

    if (lastActive == null) {
      currentStreak = 1;
    } else if (lastActive.difference(today).inDays == -1) {
      currentStreak++;
    } else if (lastActive != today) {
      currentStreak = 1;
    }

    if (currentStreak > longestStreak) {
      longestStreak = currentStreak;
    }

    lastActiveDate = now;
    updatedAt = now;
  }

  void consumeLife() {
    if (lives > 0) {
      lives--;
      if (lives == 4) {
        lastLifeRegenTime = DateTime.now();
      }
      updatedAt = DateTime.now();
    }
  }

  void regenerateLife() {
    if (lives < 5) {
      lives++;
      if (lives < 5) {
        lastLifeRegenTime = DateTime.now();
      } else {
        lastLifeRegenTime = null;
      }
      updatedAt = DateTime.now();
    }
  }
}
