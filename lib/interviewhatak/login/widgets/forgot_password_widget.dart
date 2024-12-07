import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.forgotPasswordScreen);
      },
      child: Text(
        AppString.forgotPassword,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
