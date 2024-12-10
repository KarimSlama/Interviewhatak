import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/app_constants.dart';
import 'package:interviewhatak/core/helpers/shared_preference.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/sign_up/controller/register_state.dart';
import 'package:interviewhatak/interviewhatak/sign_up/data/repository/register_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository registerRepository;

  RegisterCubit(this.registerRepository) : super(RegisterState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    emit(RegisterState.loading());
    await Future.delayed(const Duration(seconds: 2));
    ServerResult<String?> response = await registerRepository.registerNewUser(
      nameController.text,
      emailController.text,
      phoneController.text,
      passwordController.text,
    );
    response.when(
      success: (uId) {
        saveUserUid(uId);
        emit(RegisterState.success(uId));
      },
      failure: (error) {
        emit(RegisterState.error(error: error));
      },
    );
  }

  Future<void> saveUserUid(uId) async {
    await SharedPreference.setData(SharedPreferenceKey.userUidKey, uId);
    print('The UID in sharedpreference sign $uId');
  }
}
