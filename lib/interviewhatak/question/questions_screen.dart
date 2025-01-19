import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/loading_progress_bar_widget.dart';
import 'package:interviewhatak/interviewhatak/question/controller/cubit/question_cubit.dart';
import 'package:interviewhatak/interviewhatak/question/controller/cubit/question_state.dart';
import 'package:interviewhatak/interviewhatak/question/widget/question_list_widget.dart';
import 'package:lottie/lottie.dart';

class QuestionsScreen extends StatelessWidget {
  final String sectionName;
  const QuestionsScreen({Key? key, required this.sectionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionName),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(IconBroken.Arrow___Left)),
      ),
      body: BlocBuilder<QuestionCubit, QuestionState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingProgressBarWidget(),
            loaded: (questions) {
              if (questions.isEmpty)
                return Column(
                  spacing: 15.h,
                  children: [
                    Lottie.asset('assets/icons/empty.json'),
                    Text(AppString.thisSectionIsEmpty),
                  ],
                );
              else
                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => QuestionListWidget(
                          index: index,
                          questions: questions,
                        ),
                        childCount: questions.length,
                      ),
                    ),
                  ],
                );
            },
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
