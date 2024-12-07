import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

import '../../../core/helpers/spacing.dart';

class SignUpTitleAndSubWidget extends StatelessWidget {
  const SignUpTitleAndSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppString.signUp,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 35.sp,
              ),
        ),
        verticalSpace(10),
        const Text(
          AppString.createANewProfile,
          textAlign: TextAlign.center,
        ),
        verticalSpace(30),
      ],
    );
  }
}
