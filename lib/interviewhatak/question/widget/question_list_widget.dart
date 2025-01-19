import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

class QuestionListWidget extends StatelessWidget {
  final List<QuestionsModel> questions;
  final int index;
  const QuestionListWidget(
      {super.key, required this.index, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Material(
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
                      questions[index].question,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.6.h,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SelectableText(
                questions[index].superAnser,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(height: 1.6.h, fontSize: 16.sp),
              ),
              Text(
                'Example',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700),
              ),
              SelectableText(
                questions[index].subAnswer,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6.h,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
