import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/separator.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/text_input_fields_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/forgot_password_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_button_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_title_and_sub_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/login_with_other_method_widget.dart';
import 'package:interviewhatak/interviewhatak/login/widgets/new_user_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginTitleAndSubWidget(),
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
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
