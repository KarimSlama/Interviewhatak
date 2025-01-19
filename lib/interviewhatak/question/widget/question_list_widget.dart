import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/widgets/question_card_item_widget.dart';
import 'package:interviewhatak/interviewhatak/question/controller/cubit/question_cubit.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

class QuestionListWidget extends StatelessWidget {
  final List<QuestionsModel> questions;
  final int index;
  const QuestionListWidget(
      {super.key, required this.index, required this.questions});

  @override
  Widget build(BuildContext context) {
    return QuestionCardItemWidget(
      question: questions[index].question,
      answer: questions[index].superAnswer,
      example: questions[index].subAnswer,
      onBackPressed: () async {
        context.read<QuestionCubit>().toggleFavoriteIcon(
            questions[index].question,
            questions[index].isFavorite,
            questions[index].sectionName);
      },
      icon: Icon(
        questions[index].isFavorite ? Icons.favorite : IconBroken.Heart,
        color: questions[index].isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
