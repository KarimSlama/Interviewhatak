import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/helpers/constants.dart';
import 'package:interviewhatak/core/networking/questions/question_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

class QuestionServiceImpl implements QuestionService {
  @override
  Future<ServerResult<List<QuestionsModel>>> getQuestions(
      String sectionName) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('categories')
          .doc(Constants.categoryName)
          .collection('fields')
          .doc(Constants.fieldName)
          .collection('sections')
          .doc(sectionName)
          .collection('questions')
          .get();

      final questions = response.docs.map((doc) {
        return QuestionsModel.fromJson(doc.data());
      }).toList();
      return ServerResult.success(questions);
    } catch (error) {
      return ServerResult.failure('Failed to fetch Questions $error');
    }
  }
}
