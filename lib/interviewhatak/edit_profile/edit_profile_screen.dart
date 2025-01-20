import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/button_widet.dart';
import 'package:interviewhatak/core/widgets/text_input_fields_widget.dart';
import 'package:interviewhatak/interviewhatak/profile/controller/user_cubit.dart';
import 'package:interviewhatak/interviewhatak/profile/controller/user_state.dart';
import 'package:interviewhatak/interviewhatak/profile/data/model/user_model.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppString.editProfile),
          leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(IconBroken.Arrow___Left)),
        ),
        body: BlocListener<UserCubit, UserState>(
          listenWhen: (previous, current) =>
              current is Loading || current is Loaded || current is Error,
          listener: (context, state) {
            state.maybeWhen(
              loaded: (user) {
                context.read<UserCubit>().nameController.text = user.name;
                context.read<UserCubit>().emailController.text = user.email;
                context.read<UserCubit>().phoneController.text = user.phone;
              },
              orElse: () => {},
            );
          },
          child: Form(
            key: context.read<UserCubit>().editProfileFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                spacing: 10.h,
                children: [
                  TextInputFieldsWidget(
                    controller: context.read<UserCubit>().nameController,
                    textInputType: TextInputType.name,
                    hintName: AppString.userName,
                    prefixIcon: IconBroken.Profile,
                    validate: (value) {
                      if (value == null || value.isEmpty)
                        return AppString.pleaseEnteraValidUserName;
                    },
                  ),
                  TextInputFieldsWidget(
                    controller: context.read<UserCubit>().emailController,
                    textInputType: TextInputType.emailAddress,
                    hintName: AppString.emailAddress,
                    prefixIcon: IconBroken.Message,
                    validate: (value) {
                      if (value == null || value.isEmpty)
                        return AppString.pleaseEnteraValidEmail;
                    },
                  ),
                  TextInputFieldsWidget(
                    controller: context.read<UserCubit>().phoneController,
                    textInputType: TextInputType.phone,
                    hintName: AppString.phone,
                    prefixIcon: IconBroken.Call,
                    validate: (value) {
                      if (value == null || value.isEmpty)
                        return AppString.pleaseEnteraValidPhone;
                    },
                  ),
                  ButtonWidget(
                      onBackPressed: () {
                        if (context
                            .read<UserCubit>()
                            .editProfileFormKey
                            .currentState!
                            .validate()) {
                          context.read<UserCubit>().updateUser(UserModel(
                              name:
                                  context.read<UserCubit>().nameController.text,
                              email: context
                                  .read<UserCubit>()
                                  .emailController
                                  .text,
                              phone: context
                                  .read<UserCubit>()
                                  .phoneController
                                  .text));
                        }
                      },
                      btnText: 'Update',
                      width: 180.w),
                ],
              ),
            ),
          ),
        ));
  }
}
