import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:roadwise/auth_state.dart';
import 'package:roadwise/features/auth/domain/usercases/auth_bloc.dart';
import 'package:roadwise/subscription_entity.dart';
import 'package:roadwise/subscription_repository.dart';

final getIt = GetIt.instance;

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptionRepo = getIt<SubscriptionRepository>();
    return Scaffold(
      appBar: AppBar(title: const Text('Subscription')),
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is! AuthAuthenticated) {
              return const Center(
                child: Text('Please sign in to view subscription.'),
              );
            }
            final userId = state.user.id;
            return FutureBuilder<SubscriptionEntity?>(
              future: subscriptionRepo
                  .getUserSubscription(userId)
                  .then((res) => res.getOrElse(() => null)),
              builder: (context, userSubSnap) {
                if (userSubSnap.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                final currentSub = userSubSnap.data;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (currentSub != null) ...[
                        Text(
                          'Current Plan',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        _PlanCard(
                          plan: currentSub,
                          actionLabel: 'Cancel',
                          onAction: () async {
                            await subscriptionRepo.cancelSubscription(userId);
                            (context as Element).reassemble();
                          },
                        ),
                      ] else ...[
                        const Text(
                          'No active subscription',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                      const SizedBox(height: 24),
                      Text(
                        'Available Plans',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      FutureBuilder<List<SubscriptionEntity>>(
                        future: subscriptionRepo.getAvailablePlans().then(
                          (res) => res.getOrElse(() => []),
                        ),
                        builder: (context, availSnap) {
                          if (availSnap.connectionState !=
                              ConnectionState.done) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final plans = availSnap.data ?? [];
                          return Column(
                            children: plans
                                .map(
                                  (plan) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: _PlanCard(
                                      plan: plan,
                                      actionLabel: 'Subscribe',
                                      onAction: () async {
                                        await subscriptionRepo
                                            .createSubscription(
                                              plan.copyWith(
                                                userId: userId,
                                                startDate: DateTime.now(),
                                                expiryDate: DateTime.now(),
                                              ),
                                            );
                                        (context as Element).reassemble();
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final SubscriptionEntity plan;
  final String actionLabel;
  final VoidCallback onAction;

  const _PlanCard({
    required this.plan,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plan.name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Subscription plan", // Replace with actual description
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '₹ ${plan.price}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
