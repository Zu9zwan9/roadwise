import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String email;
  final String name;
  final String? username;
  final String? profileImageUrl;
  final int xp;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastActiveDate;
  final int lives;
  final DateTime? lastLifeRegenTime;
  final List<String> badges;
  final List<String> achievements;
  final int totalLessonsCompleted;
  final int totalQuizzesCompleted;
  final double averageScore;
  final int totalStudyTimeMinutes;
  final String subscriptionPlan;
  final DateTime? subscriptionExpiryDate;
  final bool notificationsEnabled;
  final bool soundEnabled;
  final bool darkModeEnabled;
  final String language;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.username,
    this.profileImageUrl,
    required this.xp,
    required this.currentStreak,
    required this.longestStreak,
    this.lastActiveDate,
    required this.lives,
    this.lastLifeRegenTime,
    required this.badges,
    required this.achievements,
    required this.totalLessonsCompleted,
    required this.totalQuizzesCompleted,
    required this.averageScore,
    required this.totalStudyTimeMinutes,
    required this.subscriptionPlan,
    this.subscriptionExpiryDate,
    required this.notificationsEnabled,
    required this.soundEnabled,
    required this.darkModeEnabled,
    required this.language,
    required this.createdAt,
    required this.updatedAt,
  });

  // Computed properties
  int get level => (xp / 1000).floor() + 1;
  
  int get xpForCurrentLevel => xp % 1000;
  
  int get xpForNextLevel => 1000;
  
  double get progressToNextLevel => xpForCurrentLevel / xpForNextLevel;
  
  bool get isPremium => subscriptionPlan != 'free' && 
      (subscriptionExpiryDate?.isAfter(DateTime.now()) ?? false);
  
  bool get hasLives => lives > 0;
  
  Duration get timeUntilNextLife {
    if (lives >= 5) return Duration.zero;
    if (lastLifeRegenTime == null) return Duration.zero;
    
    final nextRegenTime = lastLifeRegenTime!.add(const Duration(minutes: 30));
    final now = DateTime.now();
    
    if (nextRegenTime.isBefore(now)) return Duration.zero;
    return nextRegenTime.difference(now);
  }

  UserEntity copyWith({
    int? id,
    String? email,
    String? name,
    String? username,
    String? profileImageUrl,
    int? xp,
    int? currentStreak,
    int? longestStreak,
    DateTime? lastActiveDate,
    int? lives,
    DateTime? lastLifeRegenTime,
    List<String>? badges,
    List<String>? achievements,
    int? totalLessonsCompleted,
    int? totalQuizzesCompleted,
    double? averageScore,
    int? totalStudyTimeMinutes,
    String? subscriptionPlan,
    DateTime? subscriptionExpiryDate,
    bool? notificationsEnabled,
    bool? soundEnabled,
    bool? darkModeEnabled,
    String? language,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      username: username ?? this.username,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      xp: xp ?? this.xp,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      lives: lives ?? this.lives,
      lastLifeRegenTime: lastLifeRegenTime ?? this.lastLifeRegenTime,
      badges: badges ?? this.badges,
      achievements: achievements ?? this.achievements,
      totalLessonsCompleted: totalLessonsCompleted ?? this.totalLessonsCompleted,
      totalQuizzesCompleted: totalQuizzesCompleted ?? this.totalQuizzesCompleted,
      averageScore: averageScore ?? this.averageScore,
      totalStudyTimeMinutes: totalStudyTimeMinutes ?? this.totalStudyTimeMinutes,
      subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan,
      subscriptionExpiryDate: subscriptionExpiryDate ?? this.subscriptionExpiryDate,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      language: language ?? this.language,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        username,
        profileImageUrl,
        xp,
        currentStreak,
        longestStreak,
        lastActiveDate,
        lives,
        lastLifeRegenTime,
        badges,
        achievements,
        totalLessonsCompleted,
        totalQuizzesCompleted,
        averageScore,
        totalStudyTimeMinutes,
        subscriptionPlan,
        subscriptionExpiryDate,
        notificationsEnabled,
        soundEnabled,
        darkModeEnabled,
        language,
        createdAt,
        updatedAt,
      ];
}

