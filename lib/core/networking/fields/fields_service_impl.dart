import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/helpers/constants.dart';
import 'package:interviewhatak/core/networking/fields/fields_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/field/data/model/fields_model.dart';

class FieldsServiceImpl implements FieldsService {
  @override
  Future<ServerResult<List<FieldsModel>>> getFieldsData(
      String categoryName) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('categories')
          .doc(categoryName)
          .collection('fields')
          .get();
      Constants.categoryName = categoryName;
      final fields = response.docs.map((doc) {
        return FieldsModel.fromJson(doc.data());
      }).toList();

      return ServerResult.success(fields);
    } catch (error) {
      return ServerResult.failure('Failed to fetch Fields $error');
    }
  }
}
