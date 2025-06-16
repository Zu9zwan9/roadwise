import 'package:dartz/dartz.dart';
import 'package:roadwise/subscription_entity.dart';

import '../../core/errors/failures.dart';

abstract class SubscriptionRepository {
  Future<Either<Failure, SubscriptionEntity?>> getUserSubscription(int userId);
  Future<Either<Failure, List<SubscriptionEntity>>> getAvailablePlans();
  Future<Either<Failure, SubscriptionEntity>> createSubscription(
    SubscriptionEntity subscription,
  );
  Future<Either<Failure, SubscriptionEntity>> updateSubscription(
    SubscriptionEntity subscription,
  );
  Future<Either<Failure, void>> cancelSubscription(int userId);
  Future<Either<Failure, void>> renewSubscription(
    int userId,
    DateTime newExpiryDate,
  );
  Future<Either<Failure, bool>> verifyPurchase({
    required String transactionId,
    required String receiptData,
    required String platform,
  });
  Future<Either<Failure, void>> restorePurchases(int userId);
  Future<Either<Failure, bool>> hasFeature(int userId, String feature);
  Future<Either<Failure, Map<String, dynamic>>> getSubscriptionStatus(
    int userId,
  );
}
