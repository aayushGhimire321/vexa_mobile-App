import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vexa/core/network/api_service.dart';

import '../../core/network/hive_service.dart';
import '../../features/auth/presentation/view_model/forget_password/forgot_password_bloc.dart';
import '../../features/auth/presentation/view_model/login/login_bloc.dart';
import '../../features/auth/presentation/view_model/register/register_bloc.dart';
import '../../features/community/presentation/view_model/community_bloc.dart';
import '../../features/dashboard/presentation/view_model/dashboard/dashboard_bloc.dart';
import '../../features/onboarding/presentation/view_model/onboarding_cubit.dart';
import '../../features/settings/presentation/view_model/settings/settings_bloc.dart';
import '../../features/splash/presentation/view_model/splash_cubit.dart';
import '../../features/teams/presentation/view_model/new_team_page_bloc.dart';


final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initAuthDependencies();
  await _initCommunityDependencies();
  await _initDashboardDependencies();
  await _initOnboardingDependencies();
  await _initSettingsDependencies();
  await _initSplashScreenDependencies();
  await _initTeamsDependencies();
}
_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  getIt.registerLazySingleton<Dio>(
        () => ApiService(Dio()).dio,
  );
}

_initAuthDependencies() async {
  // Register login, signup, and forget_password blocs
  getIt.registerFactory<LoginBloc>(() => LoginBloc());
  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(
    registerUseCase: getIt(),
    uploadImageUsecase: getIt(),
  ));
  getIt.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc());
}

_initCommunityDependencies() async {
  // Register community bloc
  getIt.registerFactory<CommunityBloc>(() => CommunityBloc());
}

_initDashboardDependencies() async {
  // Register dashboard bloc
  getIt.registerFactory<DashboardBloc>(() => DashboardBloc());
}

_initOnboardingDependencies() async {
  // Register onboarding bloc
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
}

_initSettingsDependencies() async {
  // Register settings bloc
  getIt.registerFactory<SettingsBloc>(() => SettingsBloc());
}

_initSplashScreenDependencies() async {
  // Register splash screen bloc
  getIt.registerFactory<SplashCubit>(() => SplashCubit());
}

_initTeamsDependencies() async {
  // Register teams bloc
  getIt.registerFactory<TeamsBloc>(() => TeamsBloc());
}
