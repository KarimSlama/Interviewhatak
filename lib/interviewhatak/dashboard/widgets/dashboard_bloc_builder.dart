import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_cubit.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_state.dart';

class DashboardBlocBuilder extends StatelessWidget {
  const DashboardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Changed,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => setupLoading(),
          changed: (index) {
            return cubit.screens[index];
          },
          orElse: () {
            return cubit.screens[cubit.currentIndex];
          },
        );
      },
    );
  }
}

Widget setupLoading() => SpinKitCircle(color: AppColors.brown);
