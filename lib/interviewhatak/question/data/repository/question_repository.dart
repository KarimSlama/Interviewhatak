import 'package:interviewhatak/core/networking/questions/question_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

class QuestionRepository {
  final QuestionService questionService;

  QuestionRepository(this.questionService);

  Future<ServerResult<List<QuestionsModel>>> getQuestions(
      String sectionName) async {
    return await questionService.getQuestions(sectionName);
  }
}
