import 'package:flutter/cupertino.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/text_input_fields_widget.dart';

class LoginTextFieldsWidgets extends StatelessWidget {
  const LoginTextFieldsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Column(
      children: [
        TextInputFieldsWidget(
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          hintName: AppString.emailAddress,
          prefixIcon: IconBroken.Message,
        ),
        TextInputFieldsWidget(
          controller: passwordController,
          textInputType: TextInputType.visiblePassword,
          hintName: AppString.password,
          prefixIcon: IconBroken.Password,
          suffixIcon: IconBroken.Show,
          onPressed: () {},
        )
      ],
    );
  }
}
