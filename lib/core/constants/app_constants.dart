// Core constants for the RoadWise app
class AppConstants {
  // App Information
  static const String appName = 'RoadWise';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Learn road signs and traffic rules with gamification';
  
  // API Configuration
  static const String baseUrl = 'https://api.roadwise.app';
  static const String apiVersion = 'v1';
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Database Configuration
  static const String databaseName = 'roadwise_db';
  static const int databaseVersion = 1;
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userIdKey = 'user_id';
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String darkModeKey = 'dark_mode';
  static const String notificationsEnabledKey = 'notifications_enabled';
  static const String soundEnabledKey = 'sound_enabled';
  static const String languageKey = 'language';
  
  // Gamification
  static const int baseXpPerQuestion = 10;
  static const int streakBonusXp = 5;
  static const int perfectScoreBonusXp = 20;
  static const int dailyGoalXp = 100;
  static const int maxLives = 5;
  static const Duration lifeRegenTime = Duration(minutes: 30);
  
  // Subscription Plans
  static const String freePlanId = 'free';
  static const String plusPlanId = 'plus';
  static const String premiumPlanId = 'premium';
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 4.0;
  
  // Lesson Categories
  static const List<String> lessonCategories = [
    'Traffic Signs',
    'Road Markings',
    'Traffic Lights',
    'Right of Way',
    'Speed Limits',
    'Parking Rules',
    'Emergency Vehicles',
    'Pedestrian Safety',
  ];
  
  // Achievement Types
  static const List<String> achievementTypes = [
    'first_lesson',
    'streak_7',
    'streak_30',
    'perfect_score',
    'speed_demon',
    'knowledge_master',
    'social_butterfly',
    'premium_member',
  ];
}

