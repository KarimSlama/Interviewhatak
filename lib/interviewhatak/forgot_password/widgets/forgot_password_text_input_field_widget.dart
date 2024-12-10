import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

import '../../../core/widgets/text_input_fields_widget.dart';

class ForgotPasswordTextInputFieldWidget extends StatelessWidget {
  const ForgotPasswordTextInputFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return TextInputFieldsWidget(
      controller: emailController,
      textInputType: TextInputType.emailAddress,
      hintName: AppString.enterYourEmailAddress,
      prefixIcon: IconBroken.Message,
      validate: (value) {
        if (value == null || value.isEmpty)
          return 'please enter a valid email address';
        return '';
      },
    );
  }
}
