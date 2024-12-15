import 'package:flutter/material.dart';
import 'package:interviewhatak/interviewhatak/category/data/models/categories_model.dart';
import 'package:interviewhatak/interviewhatak/category/widgets/category_item_widget.dart';

class CategoryGridView extends StatelessWidget {
  final List<CategoriesModel> categories;
  const CategoryGridView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        childAspectRatio: 1 / 1.3,
        children: List.generate(
          categories.length,
          (index) => CategoryItemWidget(
            categoriesModel: categories[index],
          ),
        ),
      ),
    );
  }
}
