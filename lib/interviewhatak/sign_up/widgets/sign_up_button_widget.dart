import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/button_widet.dart';
import 'package:interviewhatak/interviewhatak/sign_up/controller/register_cubit.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onBackPressed: () {
        validateThenRegister(context);
      },
      btnText: AppString.signUp,
      width: 190.w,
    );
  }

  void validateThenRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register();
    }
  }
}
