import 'package:flutter/material.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class CircularAvatarIconBg extends StatelessWidget {
  final IconData icon;
  const CircularAvatarIconBg({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: AppColors.light,
      child: Icon(icon),
    );
  }
}
