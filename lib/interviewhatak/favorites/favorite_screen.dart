import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/question_card_item_widget.dart';
import 'package:interviewhatak/interviewhatak/favorites/controller/favorite_cubit.dart';
import 'package:interviewhatak/interviewhatak/favorites/controller/favorite_state.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoriteCubit>()..fetchAllFavorites(),
      child:
          BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
        return state.maybeWhen(
            // loading: () => const LoadingProgressBarWidget(),
            loaded: (questions) {
              print('the question is ${questions.length}');
              if (questions.isEmpty) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/icons/empty.json'),
                        Text(
                          AppString.thisSectionIsEmpty,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              } else
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.h,
                      children: [
                        Text(
                          AppString.favorites,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Flexible(
                          child: CustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => QuestionCardItemWidget(
                                    question: questions[index].question,
                                    answer: questions[index].superAnswer,
                                    example: questions[index].subAnswer,
                                    onBackPressed: () async {
                                      context
                                          .read<FavoriteCubit>()
                                          .toggleFavoriteIcon(
                                              questions[index].question,
                                              questions[index].isFavorite,
                                              questions[index].sectionName);
                                    },
                                    icon: Icon(
                                      questions[index].isFavorite
                                          ? Icons.favorite
                                          : IconBroken.Heart,
                                      color: questions[index].isFavorite
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                  childCount: questions.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            },
            orElse: () => SizedBox.shrink());
      }),
    );
  }
}
