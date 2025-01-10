import 'package:flutter/cupertino.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';

class AlertDialog extends StatelessWidget {
  const AlertDialog({super.key});

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
