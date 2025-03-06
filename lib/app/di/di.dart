import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vexa/core/network/api_service.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart'; // Import AuthRepository

import '../../core/network/hive_service.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/domain/use_case/login_usecase.dart';
import '../../features/auth/domain/use_case/profile_picture_usecase.dart';
import '../../features/auth/domain/use_case/register_usecase.dart';
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
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}

_initAuthDependencies() async {
  // Register IAuthRepository with its implementation (AuthRepository)
  getIt.registerLazySingleton<IAuthRepository>(
          () => AuthRepository(apiService: getIt<ApiService>()));

  // Register use cases with the correct IAuthRepository
  getIt.registerLazySingleton<LoginUseCase>(
          () => LoginUseCase(authrepository: getIt<IAuthRepository>()));
  getIt.registerLazySingleton<RegisterUseCase>(
          () => RegisterUseCase(authRepository: getIt<IAuthRepository>()));
  getIt.registerLazySingleton<UploadImageUseCase>(
          () => UploadImageUseCase(repository: getIt<IAuthRepository>()));

  // Register the blocs that depend on use cases
  getIt.registerFactory<LoginBloc>(
          () => LoginBloc(loginUseCase: getIt<LoginUseCase>()));

  // Register the RegisterBloc with ApiService, UploadImageUseCase, and RegisterUseCase
  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(
    getIt<ApiService>(), // Pass ApiService here
    registerUseCase: getIt<RegisterUseCase>(),
    uploadImageUseCase: getIt<UploadImageUseCase>(),
    dio: getIt<Dio>(), // Pass Dio here
  ));

  getIt.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc());
}

_initCommunityDependencies() async {
  getIt.registerFactory<CommunityBloc>(() => CommunityBloc());
}

_initDashboardDependencies() async {
  getIt.registerFactory<DashboardBloc>(() => DashboardBloc());
}

_initOnboardingDependencies() async {
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
}

_initSettingsDependencies() async {
  getIt.registerFactory<SettingsBloc>(() => SettingsBloc());
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(() => SplashCubit());
}

_initTeamsDependencies() async {
  getIt.registerFactory<TeamsBloc>(() => TeamsBloc());
}
