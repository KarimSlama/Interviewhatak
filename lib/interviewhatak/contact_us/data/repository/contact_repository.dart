import 'package:interviewhatak/core/networking/contact/contact_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/contact_us/data/model/contact_model.dart';

class ContactRepository {
  final ContactService contactService;

  ContactRepository(this.contactService);

  Future<ServerResult<void>> newMessage(ContactModel contactModel) async {
    return await contactService.newMessage(contactModel);
  }
}
