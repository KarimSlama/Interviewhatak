import 'package:interviewhatak/core/networking/sections/section_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/section/data/model/sections_model.dart';

class SectionRepository {
  final SectionService sectionService;

  SectionRepository(this.sectionService);

  Future<ServerResult<List<SectionsModel>>> getSections(
      String fieldName) async {
    return await sectionService.getSections(fieldName);
  }
}
