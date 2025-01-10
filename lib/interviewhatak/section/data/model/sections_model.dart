import 'package:interviewhatak/interviewhatak/question/data/model/questions_model.dart';

class SectionsModel {
  final String sectionName;
  final String image;
  final String sectionDate;
  final String sectionDesc;
  final List<QuestionsModel> questions;

  SectionsModel({
    required this.sectionName,
    required this.image,
    required this.sectionDate,
    required this.sectionDesc,
    required this.questions,
  });

  factory SectionsModel.fromJson(Map<String, dynamic> map) {
    return SectionsModel(
        sectionName: map['section_name'],
        sectionDesc: map['section_desc'],
        sectionDate: map['section_date'],
        image: map['image'],
        questions: List<QuestionsModel>.from(map['questions']
            .map((question) => QuestionsModel.fromJson(question))));
  }
}
