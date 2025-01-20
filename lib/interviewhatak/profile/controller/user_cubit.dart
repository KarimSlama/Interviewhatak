import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/interviewhatak/profile/controller/user_state.dart';
import 'package:interviewhatak/interviewhatak/profile/data/model/user_model.dart';
import 'package:interviewhatak/interviewhatak/profile/data/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit(this.userRepository) : super(UserState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final editProfileFormKey = GlobalKey<FormState>();

  Future<void> getUser() async {
    emit(UserState.loading());
    final result = await userRepository.getUser();
    result.when(
      success: (data) {
        emit(UserState.loaded(data));
      },
      failure: (error) => emit(UserState.error(error)),
    );
  }

  Future<void> updateUser(UserModel user) async {
    emit(UserState.loading());
    final result = await userRepository.updateUser(user);
    result.when(
      success: (data) => emit(UserState.loaded(user)),
      failure: (error) => emit(UserState.error(error)),
    );
  }

  Future<void> signOut() async {
    try {
      await userRepository.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      final user = UserModel(name: '', email: '', phone: '');
      emit(UserState.out(user));
    } catch (error) {
      print('the error when logout is ${error.toString()}');
      emit(UserState.error(error.toString()));
    }
  }
}
