class QuestionsModel {
  final String categoryName;
  final String fieldName;
  final String sectionName;
  final String question;
  final String superAnser;
  final String subAnswer;
  final bool isFavorite;

  QuestionsModel(
      {required this.categoryName,
      required this.fieldName,
      required this.sectionName,
      required this.question,
      required this.superAnser,
      required this.subAnswer,
      required this.isFavorite});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      categoryName: json['category_name'],
      fieldName: json['field_name'],
      sectionName: json['section_name'],
      question: json['question'],
      superAnser: json['super_answer'],
      subAnswer: json['sub_answer'],
      isFavorite: json['is_favorite'],
    );
  }
}
