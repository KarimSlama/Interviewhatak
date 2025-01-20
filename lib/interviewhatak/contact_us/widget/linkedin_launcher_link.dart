import 'package:flutter/material.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkedinLauncherLink extends StatelessWidget {
  const LinkedinLauncherLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppString.developedBy),
        TextButton(
          onPressed: () {
            launchUrlString('https://www.linkedin.com/in/karim-slama-');
          },
          child: Text(
            'karim slama',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.orange),
          ),
        ),
      ],
    );
  }
}
