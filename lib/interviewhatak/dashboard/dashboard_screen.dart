import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/interviewhatak/category/controller/category_cubit.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_cubit.dart';
import 'package:interviewhatak/interviewhatak/dashboard/widgets/dashboard_bloc_builder.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();

    /// Will Modify It Later
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..fetchingData(),
      child: Scaffold(
        body: DashboardBlocBuilder(),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.orange,
          buttonBackgroundColor: AppColors.orange,
          index: cubit.currentIndex,
          onTap: (index) {
            cubit.changeDashboardScreen(index);
          },
          items: const [
            Icon(IconBroken.Home),
            Icon(IconBroken.Heart),
            Icon(IconBroken.Notification),
            Icon(IconBroken.Profile),
          ],
        ),
      ),
    );
  }
}
