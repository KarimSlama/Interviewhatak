class QuestionsModel {
  final String questionText;
  final String answer;
  final String difficultyLevel;
  final String exampleText;
  final String image;
  final bool isFavorite;

  QuestionsModel({
    required this.questionText,
    required this.answer,
    required this.difficultyLevel,
    required this.exampleText,
    required this.image,
    this.isFavorite = false,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> map) {
    return QuestionsModel(
      questionText: map['question_text'],
      answer: map['answer'],
      difficultyLevel: map['difficulty_level'],
      exampleText: map['example_text'],
      image: map['image'],
      isFavorite: map['is_favorite'],
    );
  }
}
