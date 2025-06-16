import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadwise/features/auth/presentation/pages/onboarding_page.dart';
import 'package:roadwise/features/auth/presentation/pages/sign_in_page.dart';
import 'package:roadwise/features/auth/presentation/pages/sign_up_page.dart';
import 'package:roadwise/features/auth/presentation/pages/welcome_page.dart';
import 'package:roadwise/features/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:roadwise/features/lessons/presentation/pages/lesson_detail_page.dart';
import 'package:roadwise/features/lessons/presentation/pages/lessons_page.dart';
import 'package:roadwise/features/profile/presentation/pages/profile_page.dart';
import 'package:roadwise/features/quiz/presentation/pages/quiz_page.dart';
import 'package:roadwise/features/quiz/presentation/pages/quiz_result_page.dart';
import 'package:roadwise/presentation/pages/home_page.dart';
import 'package:roadwise/presentation/pages/settings_page.dart';
import 'package:roadwise/presentation/pages/subscription_page.dart';

import '../../../lessons_page.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String lessons = '/lessons';
  static const String lessonDetail = '/lessons/:lessonId';
  static const String quiz = '/quiz/:quizId';
  static const String quizResult = '/quiz-result';
  static const String profile = '/profile';
  static const String leaderboard = '/leaderboard';
  static const String subscription = '/subscription';
  static const String settings = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: welcome,
    routes: [
      GoRoute(
        path: welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: signIn,
        name: 'signIn',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: signUp,
        name: 'signUp',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: lessons,
        name: 'lessons',
        builder: (context, state) => const LessonsPage(),
      ),
      GoRoute(
        path: lessonDetail,
        name: 'lessonDetail',
        builder: (context, state) {
          final lessonId = int.parse(state.pathParameters['lessonId']!);
          return LessonDetailPage(lessonId: lessonId);
        },
      ),
      GoRoute(
        path: quiz,
        name: 'quiz',
        builder: (context, state) {
          final quizId = state.pathParameters['quizId']!;
          return QuizPage(quizId: quizId);
        },
      ),
      GoRoute(
        path: quizResult,
        name: 'quizResult',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return QuizResultPage(
            score: extra?['score'] ?? 0,
            totalQuestions: extra?['totalQuestions'] ?? 0,
            correctAnswers: extra?['correctAnswers'] ?? 0,
            timeSpent: extra?['timeSpent'] ?? Duration.zero,
          );
        },
      ),
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: leaderboard,
        name: 'leaderboard',
        builder: (context, state) => const LeaderboardPage(),
      ),
      GoRoute(
        path: subscription,
        name: 'subscription',
        builder: (context, state) => const SubscriptionPage(),
      ),
      GoRoute(
        path: settings,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
    redirect: (context, state) {
      return null;
    },
  );
}
