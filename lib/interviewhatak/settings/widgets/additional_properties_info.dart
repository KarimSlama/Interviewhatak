import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/separator.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/settings/controller/setting_cubit.dart';
import 'package:interviewhatak/interviewhatak/settings/controller/setting_state.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/custom_switch.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/property_row_widget.dart';

class AdditionalPropertiesInfo extends StatelessWidget {
  const AdditionalPropertiesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Material(
          elevation: 10,
          borderRadius: BorderRadiusDirectional.circular(20),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.additional),
                  Row(
                    children: [
                      PropertyRowWidget(
                        icon: Icons.light_mode,
                        hint: AppString.theme,
                        title: context.read<SettingCubit>().isDark
                            ? AppString.dark
                            : AppString.light,
                      ),
                      Spacer(),
                      CustomSwitch(
                        initialValue: context.read<SettingCubit>().isDark,
                        onChanged: (value) {
                          context.read<SettingCubit>().changeMode(value);
                        },
                      ),
                    ],
                  ),
                  heightSeparator(),
                  PropertyRowWidget(
                      icon: IconBroken.Notification,
                      hint: AppString.notification,
                      title: AppString.enabled),
                  heightSeparator(),
                  PropertyRowWidget(
                      icon: IconBroken.Close_Square,
                      hint: AppString.closeAccount,
                      title: AppString.closeAccountFromGooglePlay),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
