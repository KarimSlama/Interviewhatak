import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/app_constants.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/interviewhatak/splash/widget/text_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late Widget widget;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TextSplash(),
    );
  } //end build()

  Future navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {
      context.pushNamed(
        isLoggedUser ? Routes.dashboardScreen : Routes.onBoardingScreen,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }
}
