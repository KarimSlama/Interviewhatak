import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/helpers/constants.dart';
import 'package:interviewhatak/core/networking/sections/section_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/section/data/model/sections_model.dart';

class SectionServiceImpl implements SectionService {
  @override
  Future<ServerResult<List<SectionsModel>>> getSections(
      String fieldName) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('categories')
          .doc(Constants.categoryName)
          .collection('fields')
          .doc(fieldName)
          .collection('sections')
          .get();
      Constants.fieldName = fieldName;
      final sections = response.docs.map((doc) {
        return SectionsModel.fromJson(doc.data());
      }).toList();
      return ServerResult.success(sections);
    } catch (error) {
      return ServerResult.failure('Failed to fetch Sections $error');
    }
  }
}
