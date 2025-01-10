import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/core/widgets/loading_progress_bar_widget.dart';
import 'package:interviewhatak/interviewhatak/field/controller/field_cubit.dart';
import 'package:interviewhatak/interviewhatak/field/controller/field_state.dart';
import 'package:interviewhatak/interviewhatak/field/widget/animated_field_animated_list_widget.dart';

class FieldBlocBuilder extends StatelessWidget {
  const FieldBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit, FieldState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => LoadingProgressBarWidget(),
          success: (data) {
            final cubit = context.read<FieldCubit>();
            return AnimatedFieldAnimatedListWidget(
              fields: cubit.fields,
              listKey: cubit.listKey,
            );
          },
          error: (error) => Text('Field Bloc Builder message is ${error}'),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
