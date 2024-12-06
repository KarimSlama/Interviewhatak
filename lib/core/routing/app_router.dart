import 'package:flutter/material.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/interviewhatak/splash/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return null;
    }
  }
}
