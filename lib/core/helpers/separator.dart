import 'package:flutter/cupertino.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

Widget heightSeparator() => Container(
      width: double.infinity,
      height: 1,
      color: AppColors.grey,
    );

Widget widthSeparator() => Container(
  width: 1,
  height: double.infinity,
  color: AppColors.grey,
);
