import 'package:flutter/material.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: initialValue,
      onChanged: onChanged,
      activeColor: AppColors.orange,
    );
  }
}
