import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_cubit.dart';
import 'package:interviewhatak/interviewhatak/dashboard/dashboard_screen.dart';
import 'package:interviewhatak/interviewhatak/forgot_password/forgot_password_screen.dart';
import 'package:interviewhatak/interviewhatak/home/home_screen.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_cubit.dart';
import 'package:interviewhatak/interviewhatak/login/login_screen.dart';
import 'package:interviewhatak/interviewhatak/on_boarding/on_boarding_screen.dart';
import 'package:interviewhatak/interviewhatak/sign_up/controller/register_cubit.dart';
import 'package:interviewhatak/interviewhatak/sign_up/sign_up_screen.dart';
import 'package:interviewhatak/interviewhatak/splash/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: SignUpScreen(),
          ),
        );

      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
        );

      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<DashboardCubit>(),
              child: DashboardScreen()),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      default:
        return null;
    }
  }
}
