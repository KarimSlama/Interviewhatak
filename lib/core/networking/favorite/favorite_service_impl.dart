import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/helpers/constants.dart';
import 'package:interviewhatak/core/networking/favorite/favorite_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

class FavoriteServiceImpl implements FavoriteService {
  @override
  Future<ServerResult<List<QuestionsModel>>> getFavoriteQuestions() async {
    List<QuestionsModel> favoriteQuestions = [];

    try {
      final favoriteQuestionsSnapshot = await FirebaseFirestore.instance
          .collectionGroup('questions')
          .where('is_favorite', isEqualTo: true)
          .get();

      for (var doc in favoriteQuestionsSnapshot.docs) {
        final question = QuestionsModel.fromJson(doc.data());
        favoriteQuestions.add(question);
      }
      return ServerResult.success(favoriteQuestions);
    } catch (error) {
      return ServerResult.failure('Error fetching favorite questions: $error');
    }
  }

  @override
  Future<ServerResult<void>> toggleFavorite(
      String questionId, bool isFavorite, sectionName) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('categories')
          .doc(Constants.categoryName)
          .collection('fields')
          .doc(Constants.fieldName)
          .collection('sections')
          .doc(sectionName)
          .collection('questions')
          .doc(questionId)
          .update({'is_favorite': !isFavorite});
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
