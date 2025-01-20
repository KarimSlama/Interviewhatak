import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/interviewhatak/favorites/controller/favorite_state.dart';
import 'package:interviewhatak/interviewhatak/favorites/data/repository/favorite_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteCubit(this.favoriteRepository) : super(FavoriteState.initial());

  Future<void> fetchAllFavorites() async {
    // emit(FavoriteState.loading());
    final result = await favoriteRepository.getFavoriteQuestions();
    result.when(
      success: (data) {
        emit(FavoriteState.loaded(data));
      },
      failure: (error) {
        emit(FavoriteState.error(error.toString()));
      },
    );
  }

  Future<void> toggleFavoriteIcon(
      String questionId, bool isFavorite, String sectionName) async {
    emit(FavoriteState.loading());
    final result = await favoriteRepository.toggleFavorite(
        questionId, isFavorite, sectionName);

    result.when(
      success: (data) {
        final currentState = state;
        if (currentState is Loaded) {
          final updatedQuestions = currentState.questions.where((question) {
            if (isFavorite) {
              return question.question != questionId;
            }
            return true;
          }).toList();
          if (updatedQuestions.isEmpty) {
            data = null;
          }
        }
      },
      failure: (error) => emit(FavoriteState.error(error)),
    );
  }
}
