import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/app_router.dart';
import 'bottom_navigation_bar.dart';

/// A shell widget that contains the bottom navigation bar and the current page.
///
/// This widget is used with GoRouter's ShellRoute to provide a persistent
/// bottom navigation bar across the main app sections.
class AppShell extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const AppShell({super.key, required this.child, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          // Navigate to the appropriate route based on the selected index
          switch (index) {
            case 0:
              context.go(AppRouter.home);
              break;
            case 1:
              context.go(AppRouter.lessons);
              break;
            case 2:
              context.go(AppRouter.leaderboard);
              break;
            case 3:
              context.go(AppRouter.profile);
              break;
          }
        },
      ),
    );
  }
}
