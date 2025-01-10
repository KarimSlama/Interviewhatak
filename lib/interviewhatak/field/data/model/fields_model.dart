class FieldsModel {
  final String fieldName;
  final String fieldDate;
  final String categoryName;
  final String color;
  final String description;

  FieldsModel({
    required this.fieldName,
    required this.fieldDate,
    required this.categoryName,
    required this.color,
    required this.description,
  });

  factory FieldsModel.fromJson(Map<String, dynamic> map) {
    return FieldsModel(
      fieldName: map['field_name'],
      fieldDate: map['field_date'],
      categoryName: map['category_name'],
      color: map['color'],
      description: map['field_desc'],
    );
  }
}
