class QuestionsModel {
  final String categoryName;
  final String fieldName;
  final String sectionName;
  final String question;
  final String superAnswer;
  final String subAnswer;
  final bool isFavorite;

  QuestionsModel(
      {required this.categoryName,
      required this.fieldName,
      required this.sectionName,
      required this.question,
      required this.superAnswer,
      required this.subAnswer,
      required this.isFavorite});

  QuestionsModel copyWith({
    String? id,
    String? question,
    String? superAnswer,
    String? subAnswer,
    bool? isFavorite,
    String? sectionName,
  }) {
    return QuestionsModel(
      categoryName: categoryName,
      fieldName: fieldName,
      question: question ?? this.question,
      superAnswer: superAnswer ?? this.superAnswer,
      subAnswer: subAnswer ?? this.subAnswer,
      isFavorite: isFavorite ?? this.isFavorite,
      sectionName: sectionName ?? this.sectionName,
    );
  }

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      categoryName: json['category_name'],
      fieldName: json['field_name'],
      sectionName: json['section_name'],
      question: json['question'],
      superAnswer: json['super_answer'],
      subAnswer: json['sub_answer'],
      isFavorite: json['is_favorite'],
    );
  }
}
