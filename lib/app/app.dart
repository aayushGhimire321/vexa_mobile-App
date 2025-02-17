import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/theme/theme.dart';
import '../features/auth/domain/use_case/login_usecase.dart';
import '../features/auth/presentation/view/forget_password.dart';
import '../features/auth/presentation/view_model/login/login_bloc.dart';
import '../features/splash/presentation/view/splash_screen.dart';
import '../features/auth/presentation/view/login_screen.dart';
import '../features/auth/presentation/view/register_screen.dart';
import '../features/dashboard/presentation/view/dashboard_screen.dart';
import '../features/splash/presentation/view_model/splash_cubit.dart';
import 'di/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) => getIt<SplashCubit>(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            loginUseCase: getIt<LoginUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Project Management',
        theme: AppTheme().themeData(isDarkMode: false),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgot_password': (context) =>  ForgotPasswordScreen(),
          '/dashboard': (context) =>  DashboardScreen(),
        },
      ),
    );
  }
}
