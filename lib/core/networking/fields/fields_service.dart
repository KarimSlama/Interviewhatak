import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/field/data/model/fields_model.dart';

abstract class FieldsService {
  Future<ServerResult<List<FieldsModel>>> getFieldsData(String categoryName);
}
