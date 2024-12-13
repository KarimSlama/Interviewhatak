import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class NewUserWidget extends StatelessWidget {
  const NewUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.signUpScreen);
      },
      child: Text(
        AppString.newUser,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
