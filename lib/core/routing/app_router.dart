import 'package:flutter/material.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/interviewhatak/forgot_password/forgot_password_screen.dart';
import 'package:interviewhatak/interviewhatak/login/login_screen.dart';
import 'package:interviewhatak/interviewhatak/on_boarding/on_boarding_screen.dart';
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
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      default:
        return null;
    }
  }
}
