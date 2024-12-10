import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/text_input_fields_widget.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_cubit.dart';

class LoginTextFieldsWidgets extends StatefulWidget {
  const LoginTextFieldsWidgets({super.key});

  @override
  State<LoginTextFieldsWidgets> createState() => _LoginTextFieldsWidgetsState();
}

bool isPasswordObscureText = true;

class _LoginTextFieldsWidgetsState extends State<LoginTextFieldsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKay,
      child: Column(
        children: [
          TextInputFieldsWidget(
            controller: context.read<LoginCubit>().emailController,
            textInputType: TextInputType.emailAddress,
            hintName: AppString.emailAddress,
            prefixIcon: IconBroken.Message,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return AppString.pleaseEnteraValidUserName;
              }
            },
          ),
          TextInputFieldsWidget(
            controller: context.read<LoginCubit>().passwordController,
            textInputType: TextInputType.visiblePassword,
            hintName: AppString.password,
            prefixIcon: IconBroken.Password,
            isObsecureText: isPasswordObscureText,
            suffixIcon:
                isPasswordObscureText ? IconBroken.Show : IconBroken.Hide,
            onPressed: () {
              setState(() {
                isPasswordObscureText = !isPasswordObscureText;
              });
            },
            validate: (value) {
              if (value == null || value.isEmpty) {
                return AppString.pleaseEnteraValidPassword;
              }
            },
          )
        ],
      ),
    );
  }
}
