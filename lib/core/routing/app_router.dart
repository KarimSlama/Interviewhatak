import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/interviewhatak/about_us/about_us_screen.dart';
import 'package:interviewhatak/interviewhatak/contact_us/contact_us_screen.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_cubit.dart';
import 'package:interviewhatak/interviewhatak/dashboard/dashboard_screen.dart';
import 'package:interviewhatak/interviewhatak/edit_profile/edit_profile_screen.dart';
import 'package:interviewhatak/interviewhatak/field/controller/field_cubit.dart';
import 'package:interviewhatak/core/helpers/const.dart/fields_args.dart';
import 'package:interviewhatak/interviewhatak/field/fields_screen.dart';
import 'package:interviewhatak/interviewhatak/forgot_password/forgot_password_screen.dart';
import 'package:interviewhatak/interviewhatak/category/category_screen.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_cubit.dart';
import 'package:interviewhatak/interviewhatak/login/login_screen.dart';
import 'package:interviewhatak/interviewhatak/on_boarding/on_boarding_screen.dart';
import 'package:interviewhatak/interviewhatak/question/controller/cubit/question_cubit.dart';
import 'package:interviewhatak/interviewhatak/question/questions_screen.dart';
import 'package:interviewhatak/interviewhatak/section/controller/cubit/section_cubit.dart';
import 'package:interviewhatak/interviewhatak/section/sections_screen.dart';
import 'package:interviewhatak/interviewhatak/settings/settings_screen.dart';
import 'package:interviewhatak/interviewhatak/sign_up/controller/register_cubit.dart';
import 'package:interviewhatak/interviewhatak/sign_up/sign_up_screen.dart';
import 'package:interviewhatak/interviewhatak/splash/splash_screen.dart';
import 'package:interviewhatak/interviewhatak/user_management/user_management_screen.dart';

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

      case Routes.categoryScreen:
        return MaterialPageRoute(builder: (_) => CategoryScreen());

      case Routes.fieldScreen:
        String categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FieldCubit>()..loadFields(categoryName),
            child: AnimatedFieldScreen(categoryName: categoryName),
          ),
        );

      case Routes.sectionScreen:
        final args = settings.arguments as FieldsArgs;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      getIt<SectionCubit>()..getSections(args.fieldName),
                  child: SectionsScreen(
                    fieldsArgs: args,
                  ),
                ));

      case Routes.questionScreen:
        final sectionName = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      getIt<QuestionCubit>()..getQuestions(sectionName),
                  child: QuestionsScreen(
                    sectionName: sectionName,
                  ),
                ));

      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());

      case Routes.userManagementScreen:
        return MaterialPageRoute(builder: (_) => UserManagementScreen());

      case Routes.aboutUsScreen:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());

      case Routes.contactUsScreen:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());

      default:
        return null;
    }
  }
}
