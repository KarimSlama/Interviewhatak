import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class QuestionCardItemWidget extends StatelessWidget {
  final String question;
  final String answer;
  final String example;
  final Icon icon;
  final VoidCallback onBackPressed;

  const QuestionCardItemWidget(
      {super.key,
      required this.question,
      required this.answer,
      required this.example,
      required this.onBackPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadiusDirectional.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  IconBroken.Bag,
                  color: AppColors.orange,
                ),
                Flexible(
                  child: SelectableText(
                    question,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.6.h,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SelectableText(
              answer,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(height: 1.6.h, fontSize: 16.sp),
            ),
            Text(
              AppString.example,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700),
            ),
            SelectableText(
              example,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6.h,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            IconButton(
              onPressed: () {
                onBackPressed();
              },
              icon: icon,
            ),
          ],
        ),
      ),
    );
  }
}
