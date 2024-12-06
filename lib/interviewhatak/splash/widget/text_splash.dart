import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class TextSplash extends StatelessWidget {
  const TextSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppString.interviewhatak,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 45.sp,
                  fontFamily: GoogleFonts.philosopher().fontFamily,
                ),
          ),
          verticalSpace(12),
          const Text(
            AppString.prepareInspireBeReady,
          ),
        ],
      ),
    );
  }
}
