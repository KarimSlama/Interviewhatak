import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/routing/app_router.dart';
import 'package:interviewhatak/firebase_options.dart';
import 'package:interviewhatak/interviewhatak_app.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    InterviewhatakApp(
      appRouter: AppRouter(),
    ),
  );
}
