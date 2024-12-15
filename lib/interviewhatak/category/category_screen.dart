import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/category/widgets/category_bloc_builder.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/96607967?v=4',
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.welcome),
                    horizontalSpace(5),
                    Text(
                      'Karim Slama',
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
    );
  }
}
