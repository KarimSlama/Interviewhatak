import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/helpers/constants.dart';
import 'package:interviewhatak/core/routing/app_router.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/theming/app_themes/theme_dark.dart';
import 'package:interviewhatak/core/theming/app_themes/thme_light.dart';
import 'package:interviewhatak/interviewhatak/settings/controller/setting_cubit.dart';
import 'package:interviewhatak/interviewhatak/settings/controller/setting_state.dart';

class InterviewhatakApp extends StatelessWidget {
  final AppRouter? appRouter;
  final bool isDark;

  const InterviewhatakApp(
      {super.key, required this.appRouter, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: Builder(
        builder: (context) {
          return BlocProvider(
            create: (context) => SettingCubit()..changeMode(Constants.isDark),
            child: BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return MaterialApp(
                  title: AppString.interviewhatak,
                  debugShowCheckedModeBanner: false,
                  initialRoute: Routes.splashScreen,
                  onGenerateRoute: appRouter?.generateRoute,
                  theme: context.read<SettingCubit>().isDark
                      ? themeDark
                      : themeLight,
                  themeMode: ThemeMode.system,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
