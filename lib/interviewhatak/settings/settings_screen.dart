import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/constants.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/profile/data/model/user_model.dart';
import 'package:interviewhatak/interviewhatak/settings/controller/setting_cubit.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/accounts_info.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/additional_properties_info.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/personal_image_stack.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/user_email_and_user_name.dart';

class SettingsScreen extends StatelessWidget {
  final UserModel user;
  const SettingsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(IconBroken.Arrow___Left)),
        title: Text(AppString.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          spacing: 18.h,
          children: [
            Row(
              spacing: 10.w,
              children: [
                PersonalImageStack(image: user.image ?? ''),
                UserEmailAndUserName(name: user.name, email: user.email),
              ],
            ),
            AccountsInfo(email: user.email, phone: user.phone),
            AdditionalPropertiesInfo(),
          ],
        ),
      ),
    );
  }
}
