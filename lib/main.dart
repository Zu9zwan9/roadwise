import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadwise/bloc/lesson_bloc.dart';
import 'package:roadwise/core/themes/app_theme.dart';
import 'package:roadwise/data/models/database_service.dart';
import 'package:roadwise/data/models/injection.dart';
import 'package:roadwise/features/auth/domain/usercases/auth_bloc.dart';
import 'package:roadwise/features/auth/presentation/app_router.dart';

import 'auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Configure dependencies
  await configureDependencies(); // This initializes getIt with generated dependencies
  // setupDependencies() is likely still needed if you have other manual registrations,
  // but DatabaseService, AuthRepository, and LessonRepository should now be handled by injectable.
  await setupDependencies();

  // Initialize database by getting the instance from GetIt
  final dbService = getIt<DatabaseService>();
  await dbService.initialize();

  // Check existing session
  final authBloc = getIt<AuthBloc>();
  authBloc.add(AuthCheckRequested());

  // Initialize the router with the AuthBloc
  AppRouter.initRouter(authBloc);

  runApp(const RoadWiseApp());
}

class RoadWiseApp extends StatelessWidget {
  const RoadWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
        BlocProvider<LessonBloc>(create: (_) => getIt<LessonBloc>()),
      ],
      child: MaterialApp.router(
        title: 'RoadWise',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
