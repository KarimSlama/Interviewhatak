import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/helpers/app_constants.dart';
import 'package:interviewhatak/core/helpers/shared_preference.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/category/controller/category_cubit.dart';
import 'package:interviewhatak/interviewhatak/category/widgets/category_bloc_builder.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..fetchingData(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 14, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-vector/european-men-avatar_7814-344.jpg?w=740',
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.welcome),
                      horizontalSpace(5),
                      Text(
                        'Slama',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 18.sp,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(IconBroken.Search)),
                ],
              ),
              verticalSpace(25),
              CategoryBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
