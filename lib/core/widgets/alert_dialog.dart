import 'package:flutter/cupertino.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoAlertDialog(
      title: Text(AppString.doYouWantToLogout),
      actions: [
        CupertinoDialogAction(
          child: Text(AppString.no),
        ),
        CupertinoDialogAction(
          child: Text(AppString.yeah),
        ),
      ],
    );
  }
}
