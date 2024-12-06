import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/routing/app_router.dart';
import 'package:interviewhatak/interviewhatak_app.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    InterviewhatakApp(
      appRouter: AppRouter(),
    ),
  );
}
