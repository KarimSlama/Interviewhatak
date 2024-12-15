import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/networking/categories/category_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/category/data/models/categories_model.dart';

class CategoryServiceImpl implements CategoryService {
  @override
  Future<ServerResult<List<CategoriesModel>>> getCategories() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('categories').get();
      final categories = response.docs.map((doc) {
        return CategoriesModel.fromJson(doc.data());
      }).toList();
      return ServerResult.success(categories);
    } catch (error) {
      return ServerResult.failure('Failed to fetch categories$error');
    }
  }
}
