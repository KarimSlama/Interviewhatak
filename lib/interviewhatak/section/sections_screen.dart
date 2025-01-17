import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/const.dart/fields_args.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/widgets/loading_progress_bar_widget.dart';
import 'package:interviewhatak/interviewhatak/section/controller/cubit/section_cubit.dart';
import 'package:interviewhatak/interviewhatak/section/controller/cubit/section_state.dart';
import 'package:interviewhatak/interviewhatak/section/widget/grid_section_item.dart';

class SectionsScreen extends StatelessWidget {
  final FieldsArgs fieldsArgs;
  const SectionsScreen({
    Key? key,
    required this.fieldsArgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fieldsArgs.fieldName),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(IconBroken.Arrow___Left)),
      ),
      body: BlocBuilder<SectionCubit, SectionState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingProgressBarWidget(),
            success: (data) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  spacing: 20.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fieldsArgs.fieldDescription,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Flexible(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.3,
                        children: List.generate(
                          data.length,
                          (index) =>
                              GridSectionItem(sections: data, index: index),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error) => Text('Section Bloc Builder message is ${error}'),
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
