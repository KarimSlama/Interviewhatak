import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/interviewhatak/category/data/models/categories_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoryItemWidget({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
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
                image: NetworkImage(
                  categoriesModel.categoryImage,
                ),
              ),
            ),
          ),
          verticalSpace(10),
          Text(
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            categoriesModel.categoryName,
          ),
        ],
      ),
    );
  }
}
