import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

Widget heightSeparator() => Container(
      width: 250.w,
      height: .6,
      color: AppColors.white.withValues(alpha: .2),
    );

Widget widthSeparator() => Container(
      width: 1,
      height: double.infinity,
      color: AppColors.grey,
    );
