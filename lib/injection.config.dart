// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:roadwise/bloc/lesson_bloc.dart' as _i19;
import 'package:roadwise/complete_lesson_usecase.dart' as _i12;
import 'package:roadwise/data/models/database_service.dart' as _i3;
import 'package:roadwise/data/repositories/auth_repository_impl.dart' as _i10;
import 'package:roadwise/data/repositories/lesson_repository_impl.dart' as _i5;
import 'package:roadwise/domain/repositories/auth_repository.dart' as _i9;
import 'package:roadwise/download_lesson_usecase.dart' as _i14;
import 'package:roadwise/features/auth/domain/usercases/auth_bloc.dart' as _i25;
import 'package:roadwise/features/auth/domain/usercases/change_password_usecase.dart'
    as _i11;
import 'package:roadwise/features/auth/domain/usercases/delete_account_usecase.dart'
    as _i13;
import 'package:roadwise/features/auth/domain/usercases/get_current_user_usecase.dart'
    as _i15;
import 'package:roadwise/features/auth/domain/usercases/reset_password_usecase.dart'
    as _i20;
import 'package:roadwise/features/auth/domain/usercases/sign_in_usecase.dart'
    as _i21;
import 'package:roadwise/features/auth/domain/usercases/sign_out_usecase.dart'
    as _i22;
import 'package:roadwise/features/auth/domain/usercases/sign_up_usecase.dart'
    as _i23;
import 'package:roadwise/features/auth/domain/usercases/update_profile_usecase.dart'
    as _i24;
import 'package:roadwise/get_lesson_detail_usecase.dart' as _i16;
import 'package:roadwise/get_lesson_topics_usecase.dart' as _i17;
import 'package:roadwise/get_lessons_usecase.dart' as _i18;
import 'package:roadwise/lesson_repository.dart' as _i4;
import 'package:roadwise/search_lessons_usecase.dart' as _i6;
import 'package:roadwise/start_lesson_usecase.dart' as _i7;
import 'package:roadwise/toggle_lesson_favorite_usecase.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DatabaseService>(() => _i3.DatabaseService());
    gh.lazySingleton<_i4.LessonRepository>(
        () => _i5.LessonRepositoryImpl(gh<_i3.DatabaseService>()));
    gh.factory<_i6.SearchLessonsUseCase>(
        () => _i6.SearchLessonsUseCase(gh<_i4.LessonRepository>()));
    gh.factory<_i7.StartLessonUseCase>(
        () => _i7.StartLessonUseCase(gh<_i4.LessonRepository>()));
    gh.factory<_i8.ToggleLessonFavoriteUseCase>(
        () => _i8.ToggleLessonFavoriteUseCase(gh<_i4.LessonRepository>()));
    gh.lazySingleton<_i9.AuthRepository>(
        () => _i10.AuthRepositoryImpl(gh<_i3.DatabaseService>()));
    gh.factory<_i11.ChangePasswordUseCase>(
        () => _i11.ChangePasswordUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i12.CompleteLessonUseCase>(
        () => _i12.CompleteLessonUseCase(gh<_i4.LessonRepository>()));
    gh.factory<_i13.DeleteAccountUseCase>(
        () => _i13.DeleteAccountUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i14.DownloadLessonUseCase>(
        () => _i14.DownloadLessonUseCase(gh<_i4.LessonRepository>()));
    gh.factory<_i15.GetCurrentUserUseCase>(
        () => _i15.GetCurrentUserUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i16.GetLessonDetailUseCase>(
        () => _i16.GetLessonDetailUseCase(gh<_i4.LessonRepository>()));
    gh.factory<_i17.GetLessonTopicsUseCase>(
        () => _i17.GetLessonTopicsUseCase(gh<_i4.LessonRepository>()));
    gh.factory<_i18.GetLessonsUseCase>(
        () => _i18.GetLessonsUseCase(gh<_i4.LessonRepository>()));
    gh.factory<_i19.LessonBloc>(() => _i19.LessonBloc(
          gh<_i18.GetLessonsUseCase>(),
          gh<_i16.GetLessonDetailUseCase>(),
          gh<_i17.GetLessonTopicsUseCase>(),
          gh<_i7.StartLessonUseCase>(),
          gh<_i12.CompleteLessonUseCase>(),
          gh<_i8.ToggleLessonFavoriteUseCase>(),
          gh<_i14.DownloadLessonUseCase>(),
          gh<_i6.SearchLessonsUseCase>(),
        ));
    gh.factory<_i20.ResetPasswordUseCase>(
        () => _i20.ResetPasswordUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i21.SignInUseCase>(
        () => _i21.SignInUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i22.SignOutUseCase>(
        () => _i22.SignOutUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i23.SignUpUseCase>(
        () => _i23.SignUpUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i24.UpdateProfileUseCase>(
        () => _i24.UpdateProfileUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(
          gh<_i21.SignInUseCase>(),
          gh<_i23.SignUpUseCase>(),
          gh<_i22.SignOutUseCase>(),
          gh<_i15.GetCurrentUserUseCase>(),
          gh<_i20.ResetPasswordUseCase>(),
          gh<_i24.UpdateProfileUseCase>(),
          gh<_i11.ChangePasswordUseCase>(),
          gh<_i13.DeleteAccountUseCase>(),
        ));
    return this;
  }
}
