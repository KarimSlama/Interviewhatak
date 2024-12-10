import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/separator.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/forgot_password_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_bloc_listener.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_button_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_title_and_sub_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_with_other_method_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/new_user_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_text_fields_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginTitleAndSubWidget(),
                LoginTextFieldsWidgets(),
                LoginButtonWidget(),
                ForgotPasswordWidget(),
                verticalSpace(20),
                heightSeparator(),
                verticalSpace(20),
                LoginWithOtherMethodWidget(
                    text: AppString.continueWithPhone, onPressed: () {}),
                verticalSpace(20),
                LoginWithOtherMethodWidget(
                    text: AppString.continueWithGoogle, onPressed: () {}),
                verticalSpace(15),
                NewUserWidget(),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
