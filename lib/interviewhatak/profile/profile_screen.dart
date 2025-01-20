import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/di/dependency_injection.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/core/widgets/button_widet.dart';
import 'package:interviewhatak/core/widgets/loading_progress_bar_widget.dart';
import 'package:interviewhatak/interviewhatak/profile/controller/user_cubit.dart';
import 'package:interviewhatak/interviewhatak/profile/controller/user_state.dart';
import 'package:interviewhatak/interviewhatak/profile/widget/profile_service_widget.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>()..getUser(),
      child: BlocBuilder<UserCubit, UserState>(
        buildWhen: (previous, current) =>
            current is Loading ||
            current is Loaded ||
            current is Out ||
            current is Error,
        builder: (context, state) {
          if (state is Out) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.pushNamed(Routes.splashScreen);
            });
            return const SizedBox.shrink();
          }
          return state.maybeWhen(
            loading: () => LoadingProgressBarWidget(),
            loaded: (users) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  spacing: 7.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColors.beig,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(users.image ?? ''),
                        radius: 65,
                      ),
                    ),
                    Text(
                      users.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    ButtonWidget(
                      onBackPressed: () {
                        context.pushNamed(Routes.editProfileScreen);
                      },
                      btnText: AppString.editProfile,
                      width: 180.w,
                    ),
                    verticalSpace(20),
                    ProfileServiceWidget(
                      title: AppString.settings,
                      icon: IconBroken.Setting,
                      onTap: () {
                        context.pushNamed(Routes.settingsScreen,
                            arguments: users);
                      },
                    ),
                    ProfileServiceWidget(
                      title: AppString.userManagement,
                      icon: IconBroken.User,
                      onTap: () {
                        context.pushNamed(Routes.userManagementScreen);
                      },
                    ),
                    ProfileServiceWidget(
                      title: AppString.aboutUs,
                      icon: IconBroken.More_Circle,
                      onTap: () {
                        context.pushNamed(Routes.aboutUsScreen);
                      },
                    ),
                    ProfileServiceWidget(
                      title: AppString.contactUs,
                      icon: IconBroken.Chat,
                      onTap: () {
                        context.pushNamed(Routes.contactUsScreen);
                      },
                    ),
                    ProfileServiceWidget(
                      title: AppString.logout,
                      icon: IconBroken.Logout,
                      onTap: () {
                        QuickAlert.show(
                          context: context,
                          animType: QuickAlertAnimType.slideInUp,
                          type: QuickAlertType.confirm,
                          text: AppString.doYouWantToLogout,
                          confirmBtnText: AppString.yeah,
                          onConfirmBtnTap: () =>
                              context.read<UserCubit>().signOut(),
                          cancelBtnText: AppString.no,
                          confirmBtnColor: AppColors.orange,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
