import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../core/theming/app_strings/app_string.dart';
import '../../../core/widgets/text_input_fields_widget.dart';

class SignUpTextFieldsWidgets extends StatelessWidget {
  const SignUpTextFieldsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    return Column(
      children: [
        TextInputFieldsWidget(
          controller: nameController,
          textInputType: TextInputType.name,
          hintName: AppString.userName,
          prefixIcon: IconBroken.Profile,
        ),
        TextInputFieldsWidget(
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          hintName: AppString.emailAddress,
          prefixIcon: IconBroken.Message,
        ),
        TextInputFieldsWidget(
          controller: phoneController,
          textInputType: TextInputType.phone,
          hintName: AppString.phone,
          prefixIcon: IconBroken.Call,
        ),
        TextInputFieldsWidget(
          controller: passwordController,
          textInputType: TextInputType.visiblePassword,
          hintName: AppString.password,
          prefixIcon: IconBroken.Password,
          suffixIcon: IconBroken.Show,
          onPressed: () {},
        ),
      ],
    );
  }
}
