import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/button_widet.dart';
import 'package:interviewhatak/core/widgets/text_input_fields_widget.dart';
import 'package:interviewhatak/interviewhatak/contact_us/controller/cubit/contact_cubit.dart';
import 'package:interviewhatak/interviewhatak/contact_us/widget/contact_bloc_listener.dart';
import 'package:interviewhatak/interviewhatak/contact_us/widget/contact_widgets.dart';
import 'package:interviewhatak/interviewhatak/contact_us/widget/linkedin_launcher_link.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.contactUs),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(IconBroken.Arrow___Left)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: cubit.contactFormKey,
            child: Column(
              spacing: 14.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.haveAProjectInMind,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                Text(AppString.reachOutToUsWeCanMakeSomethingAwesomeTogether),
                TextInputFieldsWidget(
                  controller: cubit.nameController,
                  textInputType: TextInputType.name,
                  hintName: AppString.userName,
                  prefixIcon: IconBroken.Profile,
                  validate: (value) {
                    if (value == null || value.isEmpty)
                      return AppString.pleaseEnteraValidUserName;
                  },
                ),
                TextInputFieldsWidget(
                  controller: cubit.emailController,
                  textInputType: TextInputType.emailAddress,
                  hintName: AppString.email,
                  prefixIcon: IconBroken.Message,
                  validate: (value) {
                    if (value == null || value.isEmpty)
                      return AppString.pleaseEnteraValidEmail;
                  },
                ),
                TextInputFieldsWidget(
                  controller: cubit.messageController,
                  textInputType: TextInputType.text,
                  hintName: AppString.message,
                  prefixIcon: IconBroken.Paper,
                  validate: (value) {
                    if (value == null || value.isEmpty)
                      return AppString.pleaseEnteraValidEmail;
                  },
                ),
                Center(
                  child: ButtonWidget(
                      onBackPressed: () {
                        if (cubit.contactFormKey.currentState!.validate()) {
                          cubit.createNewMessage();
                        }
                      },
                      btnText: AppString.send,
                      width: 180.w),
                ),
                Text(
                  AppString.moreInfo,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                ContactWidgets(),
                LinkedinLauncherLink(),
                ContactBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
