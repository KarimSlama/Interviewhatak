import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class LoginTitleAndSubWidget extends StatelessWidget {
  const LoginTitleAndSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppString.login,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 35.sp,
          ),
        ),
        verticalSpace(30),
        const Text(
          AppString.loginToLetYourselfReadyForAnyInterview,
          textAlign: TextAlign.center,
        ),
        verticalSpace(30),
      ],
    );
  }
}
