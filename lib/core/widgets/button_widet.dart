import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onBackPressed;
  final String btnText;
  final double width;

  const ButtonWidget(
      {super.key,
      required this.onBackPressed,
      required this.btnText,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onBackPressed();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.beig),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll(Size(width, 50.h)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        btnText,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
      ),
    );
  }
}
