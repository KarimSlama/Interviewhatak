import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:interviewhatak/core/helpers/app_constants.dart';
import 'package:interviewhatak/core/helpers/shared_preference.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_state.dart';
import 'package:interviewhatak/interviewhatak/login/data/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKay = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginState.loading());
    await Future.delayed(const Duration(seconds: 2));
    ServerResult<String?> respone = await loginRepository.login(
      emailController.text,
      passwordController.text,
    );

    respone.when(
      success: (uId) {
        saveUserUid(uId);
        emit(LoginState.success(uId));
      },
      failure: (error) => emit(LoginState.error(error: error)),
    );
  }

  Future<void> saveUserUid(uId) async {
    await SharedPreference.setData(SharedPreferenceKey.userUidKey, uId);
    print('The UID in sharedpreference login $uId');
  }
}
