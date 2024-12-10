import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/interviewhatak/sign_up/controller/register_cubit.dart';

import '../../../core/theming/app_strings/app_string.dart';
import '../../../core/widgets/text_input_fields_widget.dart';

class SignUpTextFieldsWidgets extends StatefulWidget {
  const SignUpTextFieldsWidgets({super.key});

  @override
  State<SignUpTextFieldsWidgets> createState() =>
      _SignUpTextFieldsWidgetsState();
}

bool isPasswordObscureText = true;
late TextEditingController passwordController;

class _SignUpTextFieldsWidgetsState extends State<SignUpTextFieldsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          TextInputFieldsWidget(
            controller: context.read<RegisterCubit>().nameController,
            textInputType: TextInputType.name,
            hintName: AppString.userName,
            prefixIcon: IconBroken.Profile,
            validate: (value) {
              if (value == null || value.isEmpty)
                return AppString.pleaseEnteraValidUserName;
            },
          ),
          TextInputFieldsWidget(
            controller: context.read<RegisterCubit>().emailController,
            textInputType: TextInputType.emailAddress,
            hintName: AppString.emailAddress,
            prefixIcon: IconBroken.Message,
            validate: (value) {
              if (value == null || value.isEmpty)
                return AppString.pleaseEnteraValidEmail;
            },
          ),
          TextInputFieldsWidget(
            controller: context.read<RegisterCubit>().phoneController,
            textInputType: TextInputType.phone,
            hintName: AppString.phone,
            prefixIcon: IconBroken.Call,
            validate: (value) {
              if (value == null || value.isEmpty)
                return AppString.pleaseEnteraValidPhone;
            },
          ),
          TextInputFieldsWidget(
            controller: passwordController,
            textInputType: TextInputType.visiblePassword,
            hintName: AppString.password,
            isObsecureText: isPasswordObscureText,
            prefixIcon: IconBroken.Password,
            suffixIcon:
                isPasswordObscureText ? IconBroken.Show : IconBroken.Hide,
            onPressed: () {
              setState(() {
                isPasswordObscureText = !isPasswordObscureText;
              });
            },
            validate: (value) {
              if (value == null || value.isEmpty)
                return AppString.pleaseEnteraValidPassword;
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
  }
}
