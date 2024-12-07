import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:icon_broken/icon_broken.dart';

class LoginTextFieldsWidget extends StatelessWidget {
  const LoginTextFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Column(
      children: [
        Material(
          elevation: 7,
          shadowColor: AppColors.light,
          borderRadius: BorderRadiusDirectional.circular(20.0),
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: AppString.emailAddress,
              prefixIcon: Icon(
                IconBroken.Profile,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        verticalSpace(30),
        Material(
          elevation: 7,
          shadowColor: AppColors.light,
          borderRadius: BorderRadiusDirectional.circular(20.0),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: AppString.password,
              prefixIcon: const Icon(
                IconBroken.Password,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconBroken.Show,
                  )),
              border: InputBorder.none,
            ),
          ),
        ),
        verticalSpace(30),
      ],
    );
  }
}
