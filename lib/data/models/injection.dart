import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
}

// Manual registration for dependencies that need special setup
Future<void> setupDependencies() async {
  // This will be called after the generated configuration
  // Registrations for DatabaseService, AuthRepository, and LessonRepository
  // are now handled by @injectable annotations and the generated code.
  // You can add other manual registrations here if needed for classes
  // that cannot be easily annotated or require complex setup.

  // Example:
  // if (!getIt.isRegistered<SomeComplexService>()) {
  //   getIt.registerSingleton<SomeComplexService>(SomeComplexService(param1: getIt()));
  // }
}
