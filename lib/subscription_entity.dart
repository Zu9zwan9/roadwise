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

  bool get isExpired => expiryDate != null && expiryDate!.isBefore(DateTime.now());
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

