import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/separator.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/property_row_widget.dart';

class AccountsInfo extends StatelessWidget {
  final String email;
  final String phone;
  const AccountsInfo({super.key, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadiusDirectional.circular(20),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppString.account),
              Row(
                spacing: 5.w,
                children: [
                  Text(AppString.signedInAs),
                  Text(email),
                ],
              ),
              PropertyRowWidget(
                  icon: IconBroken.Calling,
                  hint: AppString.mobilePhone,
                  title: phone),
              heightSeparator(),
              PropertyRowWidget(
                icon: Icons.language_outlined,
                hint: AppString.languages,
                title: 'English',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
