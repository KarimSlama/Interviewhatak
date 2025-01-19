import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/helpers/constants.dart';
import 'package:interviewhatak/core/networking/server_result.dart';

class ToggleFavoriteUseCase {
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
