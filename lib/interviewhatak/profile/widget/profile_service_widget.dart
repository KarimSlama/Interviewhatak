import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';

class ProfileServiceWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const ProfileServiceWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          spacing: 12.w,
          children: [
            Icon(icon),
            Text(title),
            const Spacer(),
            const Icon(IconBroken.Arrow___Right_2),
          ],
        ),
      ),
    );
  }
}
