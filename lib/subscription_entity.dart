import 'package:equatable/equatable.dart';

class SubscriptionEntity extends Equatable {
  final int id;
  final int userId;
  final String planId;
  final String planName;
  final double price;
  final String currency;
  final String billingPeriod;
  final DateTime? startDate;
  final DateTime? expiryDate;
  final bool isActive;
  final bool autoRenew;
  final String? transactionId;
  final String? receiptData;
  final String platform;
  final List<String> features;
  final int maxOfflineDownloads;
  final int maxLives;
  final bool unlimitedQuizRetries;
  final bool adaptiveLearning;
  final bool exclusiveBadges;
  final bool prioritySupport;
  final bool adFree;
  final DateTime? lastVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SubscriptionEntity({
    required this.id,
    required this.userId,
    required this.planId,
    required this.planName,
    required this.price,
    required this.currency,
    required this.billingPeriod,
    this.startDate,
    this.expiryDate,
    required this.isActive,
    required this.autoRenew,
    this.transactionId,
    this.receiptData,
    required this.platform,
    required this.features,
    required this.maxOfflineDownloads,
    required this.maxLives,
    required this.unlimitedQuizRetries,
    required this.adaptiveLearning,
    required this.exclusiveBadges,
    required this.prioritySupport,
    required this.adFree,
    this.lastVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  // Add this getter for compatibility
  String get name => planName;

  // Add this method for copyWith functionality
  SubscriptionEntity copyWith({
    int? id,
    int? userId,
    String? planId,
    String? planName,
    double? price,
    String? currency,
    String? billingPeriod,
    DateTime? startDate,
    DateTime? expiryDate,
    bool? isActive,
    bool? autoRenew,
    String? transactionId,
    String? receiptData,
    String? platform,
    List<String>? features,
    int? maxOfflineDownloads,
    int? maxLives,
    bool? unlimitedQuizRetries,
    bool? adaptiveLearning,
    bool? exclusiveBadges,
    bool? prioritySupport,
    bool? adFree,
    DateTime? lastVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SubscriptionEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      planId: planId ?? this.planId,
      planName: planName ?? this.planName,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      billingPeriod: billingPeriod ?? this.billingPeriod,
      startDate: startDate ?? this.startDate,
      expiryDate: expiryDate ?? this.expiryDate,
      isActive: isActive ?? this.isActive,
      autoRenew: autoRenew ?? this.autoRenew,
      transactionId: transactionId ?? this.transactionId,
      receiptData: receiptData ?? this.receiptData,
      platform: platform ?? this.platform,
      features: features ?? this.features,
      maxOfflineDownloads: maxOfflineDownloads ?? this.maxOfflineDownloads,
      maxLives: maxLives ?? this.maxLives,
      unlimitedQuizRetries: unlimitedQuizRetries ?? this.unlimitedQuizRetries,
      adaptiveLearning: adaptiveLearning ?? this.adaptiveLearning,
      exclusiveBadges: exclusiveBadges ?? this.exclusiveBadges,
      prioritySupport: prioritySupport ?? this.prioritySupport,
      adFree: adFree ?? this.adFree,
      lastVerified: lastVerified ?? this.lastVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // ... rest of your class remains unchanged ...
  bool get isExpired =>
      expiryDate != null && expiryDate!.isBefore(DateTime.now());
  bool get isValid => isActive && !isExpired;
  bool get isFree => planId == 'free';
  bool get isPlus => planId == 'plus';
  bool get isPremium => planId == 'premium';
  bool get isLifetime => billingPeriod == 'lifetime';

  Duration? get timeUntilExpiry {
    if (expiryDate == null || isLifetime) return null;
    final now = DateTime.now();
    if (expiryDate!.isBefore(now)) return Duration.zero;
    return expiryDate!.difference(now);
  }

  String get statusText {
    if (!isActive) return 'Inactive';
    if (isExpired) return 'Expired';
    if (isLifetime) return 'Lifetime';
    return 'Active';
  }

  String get planDisplayName {
    switch (planId) {
      case 'free':
        return 'Free';
      case 'plus':
        return 'RoadWise Plus';
      case 'premium':
        return 'RoadWise Premium';
      default:
        return planName;
    }
  }

  String get priceText {
    if (price == 0) return 'Free';
    if (isLifetime) return '\$${price.toStringAsFixed(2)} (Lifetime)';
    final periodText = billingPeriod == 'monthly' ? '/month' : '/year';
    return '\$${price.toStringAsFixed(2)}$periodText';
  }

  String get billingPeriodText {
    switch (billingPeriod) {
      case 'monthly':
        return 'Monthly';
      case 'yearly':
        return 'Yearly';
      case 'lifetime':
        return 'Lifetime';
      default:
        return 'Unknown';
    }
  }

  String? get expiryText {
    if (expiryDate == null || isLifetime) return null;
    final timeLeft = timeUntilExpiry;
    if (timeLeft == null || timeLeft == Duration.zero) return 'Expired';
    if (timeLeft.inDays > 0) {
      return 'Expires in ${timeLeft.inDays} days';
    } else if (timeLeft.inHours > 0) {
      return 'Expires in ${timeLeft.inHours} hours';
    } else {
      return 'Expires in ${timeLeft.inMinutes} minutes';
    }
  }

  bool hasFeature(String feature) {
    return features.contains(feature);
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    planId,
    planName,
    price,
    currency,
    billingPeriod,
    startDate,
    expiryDate,
    isActive,
    autoRenew,
    transactionId,
    receiptData,
    platform,
    features,
    maxOfflineDownloads,
    maxLives,
    unlimitedQuizRetries,
    adaptiveLearning,
    exclusiveBadges,
    prioritySupport,
    adFree,
    lastVerified,
    createdAt,
    updatedAt,
  ];
}
