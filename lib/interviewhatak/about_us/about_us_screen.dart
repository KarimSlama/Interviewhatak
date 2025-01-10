import 'package:flutter/material.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppString.aboutUs);
  }
}
