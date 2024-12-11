import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/helpers/app_constants.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/helpers/shared_preference.dart';
import 'package:interviewhatak/core/routing/app_router.dart';
import 'package:interviewhatak/firebase_options.dart';
import 'package:interviewhatak/interviewhatak_app.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  checkIfUserLoggedIn();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    InterviewhatakApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfUserLoggedIn() async {
  String userKey =
      await SharedPreference.getString(SharedPreferenceKey.userUidKey);
  if (!userKey.isNullOrEmpty()) {
    isLoggedUser = true;
  } else
    isLoggedUser = false;
}
