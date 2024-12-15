class CategoriesModel {
  final String categoryName;
  final String categoryDesc;
  final String categoryImage;
  // final List<FieldsModel> fields;

  CategoriesModel({
    required this.categoryName,
    required this.categoryDesc,
    required this.categoryImage,
    // required this.fields,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> map) {
    return CategoriesModel(
      categoryName: map['category_name'],
      categoryDesc: map['category_desc'],
      categoryImage: map['category_image'],
      // fields: List<FieldsModel>.from(
      //     map['fields'].map((field) => FieldsModel.fromJson(field))),
    );
  }
}
