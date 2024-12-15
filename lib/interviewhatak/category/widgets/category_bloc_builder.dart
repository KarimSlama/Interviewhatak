import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/interviewhatak/category/controller/category_cubit.dart';
import 'package:interviewhatak/interviewhatak/category/controller/category_state.dart';
import 'package:interviewhatak/interviewhatak/category/widgets/category_grid_view.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => setupLoading(),
          success: (data) {
            return CategoryGridView(categories: data);
          },
          error: (error) {
            return Text('Category Bloc Builder message is ${error}');
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}

Widget setupLoading() =>
    Center(child: SpinKitSpinningLines(size: 40, color: AppColors.orange));
