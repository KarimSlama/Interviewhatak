import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:interviewhatak/interviewhatak/contact_us/controller/cubit/contact_state.dart';
import 'package:interviewhatak/interviewhatak/contact_us/data/model/contact_model.dart';
import 'package:interviewhatak/interviewhatak/contact_us/data/repository/contact_repository.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactRepository contactRepository;
  ContactCubit(this.contactRepository) : super(ContactState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var contactFormKey = GlobalKey<FormState>();

  Future<void> createNewMessage() async {
    final result = await contactRepository.newMessage(
      ContactModel(
        email: emailController.text,
        name: nameController.text,
        message: messageController.text,
      ),
    );
    result.when(
        success: (data) => emit(ContactState.success()),
        failure: (error) => (ContactState.error(error: error)));
  }
}
