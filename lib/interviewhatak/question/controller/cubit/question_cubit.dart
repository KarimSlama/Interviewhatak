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
}
