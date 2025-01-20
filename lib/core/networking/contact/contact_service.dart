import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/contact_us/data/model/contact_model.dart';

abstract class ContactService {
  Future<ServerResult<void>> newMessage(ContactModel contactModel);
}
