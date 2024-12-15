import 'package:interviewhatak/core/networking/categories/category_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/category/data/models/categories_model.dart';

class CategoryRepo {
  final CategoryService categoryService;

  CategoryRepo(this.categoryService);

  Future<ServerResult<List<CategoriesModel>>> fetchingCategories() async {
    return await categoryService.getCategories();
  }
}
