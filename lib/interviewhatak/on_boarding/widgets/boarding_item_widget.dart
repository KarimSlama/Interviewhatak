import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/interviewhatak/on_boarding/models/boarding_model.dart';

class BoardingItemWidget extends StatelessWidget {
  final BoardingModel boardingModel;

  const BoardingItemWidget({super.key, required this.boardingModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(14),
      child: Column(
        children: [
          Image.asset(
            boardingModel.image,
            width: double.infinity,
            height: 400.h,
          ),
          verticalSpace(14),
          Text(
            boardingModel.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 24.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.philosopher().fontFamily,
                ),
          ),
          verticalSpace(14),
          Text(
            boardingModel.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
