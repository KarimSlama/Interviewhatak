import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/routing/app_router.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/theming/app_themes/theme_dark.dart';
import 'package:interviewhatak/core/theming/app_themes/thme_light.dart';

class InterviewhatakApp extends StatelessWidget {
  final AppRouter? appRouter;

  const InterviewhatakApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.interviewhatak,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter?.generateRoute,
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
