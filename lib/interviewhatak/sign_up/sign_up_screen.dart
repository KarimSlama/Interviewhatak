import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/separator.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/sign_up/widgets/already_have_an_account.dart';
import 'package:interviewhatak/interviewhatak/sign_up/widgets/sign_up_button_widget.dart';
import 'package:interviewhatak/interviewhatak/sign_up/widgets/sign_up_text_fields_widgets.dart';
import 'package:interviewhatak/interviewhatak/sign_up/widgets/sign_up_title_and_sub_widget.dart';
import 'package:interviewhatak/interviewhatak/sign_up/widgets/sign_up_with_other_method_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SignUpTitleAndSubWidget(),
                  SignUpTextFieldsWidgets(),
                  verticalSpace(20),
                  SignUpButtonWidget(),
                  verticalSpace(20),
                  heightSeparator(),
                  verticalSpace(20),
                  SignUpWithOtherMethodWidget(
                      text: AppString.signWithPhone, onPressed: () {}),
                  verticalSpace(20),
                  SignUpWithOtherMethodWidget(
                      text: AppString.signWithGoogle, onPressed: () {}),
                  verticalSpace(15),
                  AlreadyHaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
