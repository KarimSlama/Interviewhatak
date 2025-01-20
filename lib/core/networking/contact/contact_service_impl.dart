import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/networking/contact/contact_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/contact_us/data/model/contact_model.dart';

class ContactServiceImpl implements ContactService {
  @override
  Future<ServerResult<void>> newMessage(ContactModel contactModel) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('contact_messages')
          .doc(contactModel.name)
          .set(contactModel.toJson());
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
