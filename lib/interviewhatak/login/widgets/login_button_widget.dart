import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/button_widet.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
        onBackPressed: () {
          validateThenLogin(context);
        },
        btnText: AppString.login,
        width: 190.w);
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKay.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
