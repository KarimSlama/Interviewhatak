import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/forgot_password/widgets/forgot_password_button_widget.dart';
import 'package:interviewhatak/interviewhatak/forgot_password/widgets/forgot_password_text_input_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.forgotPasswordTitle,
        ),
        leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
          icon: Icon(
            IconBroken.Arrow___Left_2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppString.enterYourEmailAddress,
                ),
                verticalSpace(26),
                ForgotPasswordTextInputFieldWidget(),
                verticalSpace(40),
                ForgotPasswordButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
