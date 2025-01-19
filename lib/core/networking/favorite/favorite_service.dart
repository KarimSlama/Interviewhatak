import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

abstract class FavoriteService {
  Future<ServerResult<List<QuestionsModel>>> getFavoriteQuestions();
  Future<ServerResult<void>> toggleFavorite(
      String questionId, bool isFavorite, sectionName);
}
