import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

abstract class QuestionService {
  Future<ServerResult<List<QuestionsModel>>> getQuestions(String sectionName);
}
