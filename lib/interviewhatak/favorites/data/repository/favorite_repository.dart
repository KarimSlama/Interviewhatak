import 'package:interviewhatak/core/networking/favorite/favorite_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

class FavoriteRepository {
  final FavoriteService favoriteService;

  FavoriteRepository(this.favoriteService);

  Future<ServerResult<List<QuestionsModel>>> getFavoriteQuestions() async {
    return await favoriteService.getFavoriteQuestions();
  }

  Future<ServerResult<void>> toggleFavorite(
      questionId, isFavorite, sectionName) async {
    return await favoriteService.toggleFavorite(
        questionId, isFavorite, sectionName);
  }
}
