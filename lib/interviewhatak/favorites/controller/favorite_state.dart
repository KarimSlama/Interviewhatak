import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';
part 'favorite_state.freezed.dart';

@freezed
class FavoriteState<T> with _$FavoriteState<T> {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.changed() = Changed;
  const factory FavoriteState.loaded(List<QuestionsModel> questions) = Loaded;
  const factory FavoriteState.error(String message) = Error;
}
