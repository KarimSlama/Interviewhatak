class SectionsModel {
  final String sectionName;
  final String sectionDesc;
  final String sectionDate;
  final String sectionImage;
  final String sectionDifficulty;
  final String categoryName;
  final String fieldName;

  SectionsModel({
    required this.sectionName,
    required this.sectionDesc,
    required this.sectionDate,
    required this.sectionDifficulty,
    required this.categoryName,
    required this.sectionImage,
    required this.fieldName,
  });

  factory SectionsModel.fromJson(Map<String, dynamic> json) {
    return SectionsModel(
      sectionName: json['section_name'],
      sectionDesc: json['section_desc'],
      sectionDate: json['section_date'],
      sectionDifficulty: json['section_difficulty'],
      categoryName: json['category_name'],
      sectionImage: json['section_image'],
      fieldName: json['field_name'],
    );
  }
}
