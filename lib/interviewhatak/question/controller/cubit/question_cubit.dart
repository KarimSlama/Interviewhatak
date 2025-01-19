import 'package:bloc/bloc.dart';
import 'package:interviewhatak/interviewhatak/question/controller/cubit/question_state.dart';
import 'package:interviewhatak/interviewhatak/question/data/repository/question_repository.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionRepository questionRepository;

  QuestionCubit(this.questionRepository) : super(QuestionState.initial());

  Future<void> getQuestions(String sectionName) async {
    emit(QuestionState.loading());
    final result = await questionRepository.getQuestions(sectionName);
    result.when(
      success: (data) {
        emit(QuestionState.loaded(data));
      },
      failure: (error) {
        emit(QuestionState.error(error));
      },
    );
  }

  Future<void> toggleFavoriteIcon(questionId, isFavorite, sectionName) async {
    final result = await questionRepository.toggleFavorite(
        questionId, isFavorite, sectionName);

    result.when(
        success: (data) {
          final currentState = state;
          if (currentState is Loaded) {
            final updatedQuestions = currentState.questions.map((question) {
              if (question.question == questionId) {
                return question.copyWith(isFavorite: !isFavorite);
              }
              return question;
            }).toList();
            emit(QuestionState.loaded(updatedQuestions));
          }
        },
        failure: (error) => (QuestionState.error(error)));
  }
}
