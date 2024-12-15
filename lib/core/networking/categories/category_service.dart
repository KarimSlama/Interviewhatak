import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/category/data/models/categories_model.dart';

abstract class CategoryService {
  Future<ServerResult<List<CategoriesModel>>> getCategories();
}
