import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/interviewhatak/section/data/model/sections_model.dart';

class GridSectionItem extends StatelessWidget {
  final int index;
  final List<SectionsModel> sections;
  const GridSectionItem(
      {super.key, required this.index, required this.sections});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.questionScreen,
            arguments: sections[index].sectionName);
      },
      child: Column(
        spacing: 10.h,
        children: [
          Container(
            width: 150.w,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(sections[index].sectionImage),
              ),
            ),
          ),
          Text(
            sections[index].sectionName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
