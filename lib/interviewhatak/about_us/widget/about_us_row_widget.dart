import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class AboutUsRowWidget extends StatelessWidget {
  final String title;
  const AboutUsRowWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        spacing: 10.w,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            IconBroken.Paper,
            color: AppColors.orange,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
