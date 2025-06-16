import 'dart:async';

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
import 'package:roadwise/presentation/widgets/app_shell.dart';

import '../../../auth_state.dart';
import '../domain/usercases/auth_bloc.dart';

/// A class that listens to AuthBloc state changes and notifies the router
class AuthStateNotifier extends ChangeNotifier {
  final AuthBloc _authBloc;
  late final StreamSubscription<AuthState> _subscription;
  AuthState _authState;

  AuthStateNotifier(this._authBloc) : _authState = _authBloc.state {
    _subscription = _authBloc.stream.listen((state) {
      _authState = state;
      notifyListeners();
    });
  }

  AuthState get authState => _authState;

  bool get isAuthenticated => _authState is AuthAuthenticated;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  // Auth routes
  static const String welcome = '/welcome';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String onboarding = '/onboarding';

  // Main app routes
  static const String home = '/home';
  static const String lessons = '/lessons';
  static const String leaderboard = '/leaderboard';
  static const String profile = '/profile';

  // Detail routes
  static const String lessonDetail = '/lessons/:lessonId';
  static const String quiz = '/quiz/:quizId';
  static const String quizResult = '/quiz-result';
  static const String subscription = '/subscription';
  static const String settings = '/settings';

  // Static instance of AuthStateNotifier
  static AuthStateNotifier? _authStateNotifier;

  // Initialize the router with the AuthBloc
  static void initRouter(AuthBloc authBloc) {
    // Initialize the AuthStateNotifier if it hasn't been created yet
    _authStateNotifier ??= AuthStateNotifier(authBloc);
  }

  // Router instance getter
  static GoRouter get router {
    // Ensure the AuthStateNotifier is initialized
    if (_authStateNotifier == null) {
      throw Exception(
        'AppRouter.initRouter must be called before accessing the router',
      );
    }

    return GoRouter(
      refreshListenable: _authStateNotifier!,
      initialLocation: welcome,
      routes: [
        // Auth routes (outside the shell)
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

        // Shell route for main app sections with bottom navigation
        ShellRoute(
          builder: (context, state, child) {
            // Determine the current index based on the location
            int currentIndex = 0;
            final location = state.uri.toString();

            if (location.startsWith(home)) {
              currentIndex = 0;
            } else if (location.startsWith(lessons)) {
              currentIndex = 1;
            } else if (location.startsWith(leaderboard)) {
              currentIndex = 2;
            } else if (location.startsWith(profile)) {
              currentIndex = 3;
            }

            return AppShell(currentIndex: currentIndex, child: child);
          },
          routes: [
            // Home tab
            GoRoute(
              path: home,
              name: 'home',
              builder: (context, state) => const HomePage(),
            ),

            // Lessons tab
            GoRoute(
              path: lessons,
              name: 'lessons',
              builder: (context, state) => const LessonsPage(),
            ),

            // Leaderboard tab
            GoRoute(
              path: leaderboard,
              name: 'leaderboard',
              builder: (context, state) => const LeaderboardPage(),
            ),

            // Profile tab
            GoRoute(
              path: profile,
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),

        // Detail routes (outside the shell but accessible from within it)
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
        // Use the AuthStateNotifier to check authentication status
        final isAuthenticated = _authStateNotifier?.isAuthenticated ?? false;

        // List of auth routes that don't require authentication
        final isAuthRoute =
            state.uri.toString() == welcome ||
            state.uri.toString() == signIn ||
            state.uri.toString() == signUp ||
            state.uri.toString() == onboarding;

        // If the user is not authenticated and trying to access a protected route,
        // redirect to the welcome page
        if (!isAuthenticated && !isAuthRoute) {
          return welcome;
        }

        // If the user is authenticated and trying to access an auth route,
        // redirect to the home page
        if (isAuthenticated && isAuthRoute) {
          return home;
        }

        // Allow the navigation to proceed
        return null;
      },
    );
  }
}
