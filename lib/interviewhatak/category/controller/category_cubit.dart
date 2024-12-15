import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/interviewhatak/category/controller/category_state.dart';
import 'package:interviewhatak/interviewhatak/category/data/models/categories_model.dart';
import 'package:interviewhatak/interviewhatak/category/data/repository/category_repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryCubit(this.categoryRepo) : super(CategoryState.initial());

  List<CategoriesModel> categoriesList = [];

  Future<void> fetchingData() async {
    emit(CategoryState.loading());
    final result = await categoryRepo.fetchingCategories();
    result.when(
      success: (categories) {
        emit(CategoryState.loading());
        categoriesList = [];
        categoriesList = categories;
        emit(CategoryState.success(categories));
      },
      failure: (error) {
        emit(CategoryState.error(error: error));
      },
    );
  }
}
