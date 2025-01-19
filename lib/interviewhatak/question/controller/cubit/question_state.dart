import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';
part 'question_state.freezed.dart';

@freezed
class QuestionState<T> with _$QuestionState<T> {
  const factory QuestionState.initial() = _Initial;
  const factory QuestionState.loading() = Loading;
  const factory QuestionState.changed() = Changed;
  const factory QuestionState.loaded(List<QuestionsModel> questions) = Loaded;
  const factory QuestionState.error(String message) = Error;
}
