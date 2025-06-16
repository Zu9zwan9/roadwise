import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:roadwise/data/models/quiz.dart';
import 'package:roadwise/data/models/subscription.dart';
import 'package:roadwise/data/models/topic.dart';
import 'package:roadwise/data/models/user.dart';
import 'package:roadwise/data/models/user_progress.dart';

import '../../../../core/errors/exceptions.dart';
import 'leaderboard_entry.dart';
import 'lesson.dart';
import 'offline_package.dart';

@lazySingleton
class DatabaseService {
  Isar? _isarInstance;
  User?
  _loggedInUser; // Simple in-memory session, not persistent across app restarts

  DatabaseService();

  Future<void> initialize() async {
    if (_isarInstance != null) return;

    try {
      final dir = await getApplicationDocumentsDirectory();

      _isarInstance = await Isar.open(
        [
          UserSchema,
          LessonSchema,
          TopicSchema,
          QuizSchema,
          UserProgressSchema,
          LeaderboardEntrySchema,
          SubscriptionSchema,
          OfflinePackageSchema,
        ],
        directory: dir.path,
        name: 'roadwise_db',
      );
    } catch (e) {
      throw DatabaseException('Failed to initialize database: $e');
    }
  }

  Isar get isar {
    if (_isarInstance == null) {
      throw DatabaseException(
        'Database not initialized. Call initialize() first.',
      );
    }
    return _isarInstance!;
  }

  Future<void> close() async {
    await _isarInstance?.close();
    _isarInstance = null;
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  // User operations
  Future<User?> getUser(int id) async {
    try {
      return await isar.users.get(id);
    } catch (e) {
      throw DatabaseException('Failed to get user: $e');
    }
  }

  // This method effectively serves as findUserByEmail for AuthRepositoryImpl
  Future<User?> findUserByEmail(String email) async {
    try {
      return await isar.users.filter().emailEqualTo(email).findFirst();
    } catch (e) {
      throw DatabaseException('Failed to get user by email: $e');
    }
  }

  // This method effectively serves as findUserById for AuthRepositoryImpl
  Future<User?> findUserById(int userId) async {
    return getUser(userId);
  }

  Future<User> createUser({
    required String name,
    required String email,
    required String password,
    String? username,
  }) async {
    // SECURITY WARNING: Password should be securely hashed before storing in a real application.
    // For this example, we're assuming the User model stores it as is, or handles hashing.
    final user = User()
      ..name = name
      ..email = email
      ..password =
          password // Raw password, ensure User model or Isar handles hashing if applicable
      ..username = username;
    try {
      await isar.writeTxn(() async {
        await isar.users.put(user);
      });
      return user;
    } catch (e) {
      throw DatabaseException('Failed to create user: $e');
    }
  }

  Future<bool> validatePassword({
    required User user,
    required String password,
  }) async {
    // SECURITY WARNING: This is plain text comparison if passwords are not hashed.
    // In a real app, compare hashed passwords.
    return user.password == password;
  }

  Future<void> setCurrentUserSession(User user) async {
    // This is a simplistic in-memory session. For persistence, store user ID in SharedPreferences or a dedicated Isar collection.
    _loggedInUser = user;
  }

  Future<void> clearCurrentUserSession() async {
    _loggedInUser = null;
  }

  Future<User?> getCurrentUser() async {
    // This retrieves from the simplistic in-memory session.
    return _loggedInUser;
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    // Placeholder: In a real app, this would trigger a backend service to send an email.
    // For local DB, you might log this request or do nothing.
    print('Password reset requested for $email (placeholder)');
    // Simulate success
  }

  Future<User?> updateUser({
    required int userId,
    String? name,
    String? username,
    String? profileImageUrl,
  }) async {
    try {
      final user = await getUser(userId);
      if (user == null) {
        return null; // Or throw DatabaseException('User not found');
      }
      bool changed = false;
      if (name != null) {
        user.name = name;
        changed = true;
      }
      if (username != null) {
        user.username = username;
        changed = true;
      }
      if (profileImageUrl != null) {
        user.profileImageUrl = profileImageUrl;
        changed = true;
      }
      if (changed) {
        await saveUser(user);
      }
      return user;
    } catch (e) {
      throw DatabaseException('Failed to update user: $e');
    }
  }

  Future<void> updatePassword({
    required int userId,
    required String newPassword,
  }) async {
    // SECURITY WARNING: New password should be securely hashed.
    try {
      final user = await getUser(userId);
      if (user == null) {
        throw DatabaseException('User not found for password update.');
      }
      user.password = newPassword; // Raw password, ensure hashing if applicable
      await saveUser(user);
    } catch (e) {
      throw DatabaseException('Failed to update password: $e');
    }
  }

  Future<bool> deleteUserAndReturnBool(int id) async {
    try {
      final success = await isar.writeTxn(() async {
        return await isar.users.delete(id);
      });
      return success;
    } catch (e) {
      throw DatabaseException('Failed to delete user: $e');
    }
  }

  Future<int> saveUser(User user) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.users.put(user);
      });
    } catch (e) {
      throw DatabaseException('Failed to save user: $e');
    }
  }

  // Lesson operations
  Future<List<Lesson>> getAllLessons() async {
    try {
      return await isar.lessons.where().findAll();
    } catch (e) {
      throw DatabaseException('Failed to get lessons: $e');
    }
  }

  Future<List<Lesson>> getLessonsByCategory(String category) async {
    try {
      return await isar.lessons.filter().categoryEqualTo(category).findAll();
    } catch (e) {
      throw DatabaseException('Failed to get lessons by category: $e');
    }
  }

  Future<Lesson?> getLesson(int id) async {
    try {
      return await isar.lessons.get(id);
    } catch (e) {
      throw DatabaseException('Failed to get lesson: $e');
    }
  }

  Future<int> saveLesson(Lesson lesson) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.lessons.put(lesson);
      });
    } catch (e) {
      throw DatabaseException('Failed to save lesson: $e');
    }
  }

  // Topic operations
  Future<List<Topic>> getTopicsByLesson(int lessonId) async {
    try {
      return await isar.topics.filter().lessonIdEqualTo(lessonId).findAll();
    } catch (e) {
      throw DatabaseException('Failed to get topics by lesson: $e');
    }
  }

  Future<Topic?> getTopic(int id) async {
    try {
      return await isar.topics.get(id);
    } catch (e) {
      throw DatabaseException('Failed to get topic: $e');
    }
  }

  Future<int> saveTopic(Topic topic) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.topics.put(topic);
      });
    } catch (e) {
      throw DatabaseException('Failed to save topic: $e');
    }
  }

  // Quiz operations
  Future<List<Quiz>> getQuizzesByTopic(int topicId) async {
    try {
      return await isar.quizs.filter().topicIdEqualTo(topicId).findAll();
    } catch (e) {
      throw DatabaseException('Failed to get quizzes by topic: $e');
    }
  }

  Future<Quiz?> getQuiz(int id) async {
    try {
      return await isar.quizs.get(id);
    } catch (e) {
      throw DatabaseException('Failed to get quiz: $e');
    }
  }

  Future<int> saveQuiz(Quiz quiz) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.quizs.put(quiz);
      });
    } catch (e) {
      throw DatabaseException('Failed to save quiz: $e');
    }
  }

  // User Progress operations
  Future<UserProgress?> getUserProgress(int userId, int lessonId) async {
    try {
      return await isar.userProgress
          .filter()
          .userIdEqualTo(userId)
          .and()
          .lessonIdEqualTo(lessonId)
          .findFirst();
    } catch (e) {
      throw DatabaseException('Failed to get user progress: $e');
    }
  }

  Future<List<UserProgress>> getUserProgressList(int userId) async {
    try {
      return await isar.userProgress.filter().userIdEqualTo(userId).findAll();
    } catch (e) {
      throw DatabaseException('Failed to get user progress list: $e');
    }
  }

  Future<int> saveUserProgress(UserProgress progress) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.userProgress.put(progress);
      });
    } catch (e) {
      throw DatabaseException('Failed to save user progress: $e');
    }
  }

  // Leaderboard operations
  Future<List<LeaderboardEntry>> getLeaderboard({
    String type = 'global',
    String period = 'all_time',
    int limit = 100,
  }) async {
    try {
      return await isar.leaderboardEntrys
          .filter()
          .leaderboardTypeEqualTo(type)
          .and()
          .periodEqualTo(period)
          .sortByRank()
          .limit(limit)
          .findAll();
    } catch (e) {
      throw DatabaseException('Failed to get leaderboard: $e');
    }
  }

  Future<int> saveLeaderboardEntry(LeaderboardEntry entry) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.leaderboardEntrys.put(entry);
      });
    } catch (e) {
      throw DatabaseException('Failed to save leaderboard entry: $e');
    }
  }

  // Subscription operations
  Future<Subscription?> getUserSubscription(int userId) async {
    try {
      return await isar.subscriptions
          .filter()
          .userIdEqualTo(userId)
          .and()
          .isActiveEqualTo(true)
          .findFirst();
    } catch (e) {
      throw DatabaseException('Failed to get user subscription: $e');
    }
  }

  Future<int> saveSubscription(Subscription subscription) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.subscriptions.put(subscription);
      });
    } catch (e) {
      throw DatabaseException('Failed to save subscription: $e');
    }
  }

  // Offline Package operations
  Future<List<OfflinePackage>> getUserOfflinePackages(int userId) async {
    try {
      return await isar.offlinePackages
          .filter()
          .userIdEqualTo(userId)
          .findAll();
    } catch (e) {
      throw DatabaseException('Failed to get offline packages: $e');
    }
  }

  Future<OfflinePackage?> getOfflinePackage(int id) async {
    try {
      return await isar.offlinePackages.get(id);
    } catch (e) {
      throw DatabaseException('Failed to get offline package: $e');
    }
  }

  Future<int> saveOfflinePackage(OfflinePackage package) async {
    try {
      return await isar.writeTxn(() async {
        return await isar.offlinePackages.put(package);
      });
    } catch (e) {
      throw DatabaseException('Failed to save offline package: $e');
    }
  }

  // Batch operations
  Future<void> saveBatch<T>(List<T> items, IsarCollection<T> collection) async {
    try {
      await isar.writeTxn(() async {
        await collection.putAll(items);
      });
    } catch (e) {
      throw DatabaseException('Failed to save batch: $e');
    }
  }

  // Search operations
  Future<List<Lesson>> searchLessons(String query) async {
    try {
      return await isar.lessons
          .filter()
          .titleContains(query, caseSensitive: false)
          .or()
          .descriptionContains(query, caseSensitive: false)
          .findAll();
    } catch (e) {
      throw DatabaseException('Failed to search lessons: $e');
    }
  }

  // Statistics
  Future<Map<String, dynamic>> getUserStats(int userId) async {
    try {
      final user = await getUser(userId);
      final progressList = await getUserProgressList(userId);
      final subscription = await getUserSubscription(userId);

      final completedLessons = progressList.where((p) => p.isCompleted).length;
      final totalXP = progressList.fold<int>(
        0,
        (sum, p) => sum + p.totalXpEarned,
      );
      final totalStudyTime = progressList.fold<int>(
        0,
        (sum, p) => sum + p.totalTimeSpentMinutes,
      );
      final averageAccuracy = progressList.isNotEmpty
          ? progressList.fold<double>(0, (sum, p) => sum + p.quizAccuracy) /
                progressList.length
          : 0.0;

      return {
        'user': user,
        'completedLessons': completedLessons,
        'totalLessons': progressList.length,
        'totalXP': totalXP,
        'totalStudyTimeMinutes': totalStudyTime,
        'averageAccuracy': averageAccuracy,
        'currentStreak': user?.currentStreak ?? 0,
        'longestStreak': user?.longestStreak ?? 0,
        'isPremium': subscription?.isValid ?? false,
        'badges': user?.badges ?? [],
        'achievements': user?.achievements ?? [],
      };
    } catch (e) {
      throw DatabaseException('Failed to get user stats: $e');
    }
  }
}
