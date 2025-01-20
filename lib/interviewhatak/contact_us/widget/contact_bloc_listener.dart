import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/core/widgets/loading_progress_bar_widget.dart';
import 'package:interviewhatak/interviewhatak/contact_us/controller/cubit/contact_cubit.dart';
import 'package:interviewhatak/interviewhatak/contact_us/controller/cubit/contact_state.dart';

class ContactBlocListener extends StatelessWidget {
  const ContactBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        state.maybeWhen(
            loading: () => LoadingProgressBarWidget(),
            success: () {
              final cubit = context.read<ContactCubit>();
              cubit.nameController.text = '';
              cubit.emailController.text = '';
              cubit.messageController.text = '';
              Fluttertoast.showToast(
                msg:
                    'Thanks for reaching us, and we will get in touch with you soon!',
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 3,
                backgroundColor: AppColors.brown,
              );
            },
            orElse: SizedBox.shrink);
      },
      child: SizedBox.shrink(),
    );
  }
}
