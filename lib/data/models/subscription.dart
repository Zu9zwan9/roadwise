import 'package:isar/isar.dart';

part 'subscription.g.dart';

@collection
class Subscription {
  Id id = Isar.autoIncrement;

  late int userId;

  late String planId; // 'free', 'plus', 'premium'

  late String planName;

  double price = 0.0;

  String currency = 'USD';

  String billingPeriod = 'monthly'; // 'monthly', 'yearly', 'lifetime'

  DateTime? startDate;

  DateTime? expiryDate;

  bool isActive = true;

  bool autoRenew = false;

  String? transactionId;

  String? receiptData;

  String platform = 'app_store'; // 'app_store', 'google_play', 'web'

  List<String> features = [];

  int maxOfflineDownloads = 0;

  int maxLives = 0;

  bool unlimitedQuizRetries = false;

  bool adaptiveLearning = false;

  bool exclusiveBadges = false;

  bool prioritySupport = false;

  bool adFree = false;

  DateTime? lastVerified;

  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();

  // Computed properties
  @ignore
  bool get isExpired =>
      expiryDate != null && expiryDate!.isBefore(DateTime.now());

  @ignore
  bool get isValid => isActive && !isExpired;

  @ignore
  bool get isFree => planId == 'free';

  @ignore
  bool get isPlus => planId == 'plus';

  @ignore
  bool get isPremium => planId == 'premium';

  @ignore
  bool get isLifetime => billingPeriod == 'lifetime';

  @ignore
  Duration? get timeUntilExpiry {
    if (expiryDate == null || isLifetime) return null;
    final now = DateTime.now();
    if (expiryDate!.isBefore(now)) return Duration.zero;
    return expiryDate!.difference(now);
  }

  @ignore
  String get statusText {
    if (!isActive) return 'Inactive';
    if (isExpired) return 'Expired';
    if (isLifetime) return 'Lifetime';
    return 'Active';
  }

  @ignore
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

  @ignore
  String get priceText {
    if (price == 0) return 'Free';
    if (isLifetime) return '\$${price.toStringAsFixed(2)} (Lifetime)';

    final periodText = billingPeriod == 'monthly' ? '/month' : '/year';
    return '\$${price.toStringAsFixed(2)}$periodText';
  }

  @ignore
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

  @ignore
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

  // Methods
  void activate() {
    isActive = true;
    startDate = DateTime.now();
    updatedAt = DateTime.now();
  }

  void deactivate() {
    isActive = false;
    autoRenew = false;
    updatedAt = DateTime.now();
  }

  void renew(DateTime newExpiryDate) {
    expiryDate = newExpiryDate;
    isActive = true;
    updatedAt = DateTime.now();
  }

  void updateReceipt(String newReceiptData, String newTransactionId) {
    receiptData = newReceiptData;
    transactionId = newTransactionId;
    lastVerified = DateTime.now();
    updatedAt = DateTime.now();
  }

  void markVerified() {
    lastVerified = DateTime.now();
    updatedAt = DateTime.now();
  }

  bool hasFeature(String feature) {
    return features.contains(feature);
  }

  void addFeature(String feature) {
    if (!features.contains(feature)) {
      features.add(feature);
      updatedAt = DateTime.now();
    }
  }

  void removeFeature(String feature) {
    if (features.contains(feature)) {
      features.remove(feature);
      updatedAt = DateTime.now();
    }
  }
}
