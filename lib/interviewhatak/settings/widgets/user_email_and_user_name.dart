import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class UserEmailAndUserName extends StatelessWidget {
  final String name;
  final String email;
  const UserEmailAndUserName(
      {super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Text(email),
            IconButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(
                    text: 'email',
                  ),
                ).then((value) {
                  Fluttertoast.showToast(
                    msg: 'copied',
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 3,
                    backgroundColor: AppColors.brown,
                  );
                });
              },
              icon: const Icon(
                IconBroken.Paper,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
