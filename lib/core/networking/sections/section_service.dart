import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/section/data/model/sections_model.dart';

abstract class SectionService {
  Future<ServerResult<List<SectionsModel>>> getSections(String fieldName);
}
