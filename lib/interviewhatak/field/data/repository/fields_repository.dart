import 'package:interviewhatak/core/networking/fields/fields_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/field/data/model/fields_model.dart';

class FieldsRepository {
  final FieldsService fieldsService;

  FieldsRepository(this.fieldsService);

  Future<ServerResult<List<FieldsModel>>> fetchFieldsData(
      String categoryName) async {
    return await fieldsService.getFieldsData(categoryName);
  }
}
