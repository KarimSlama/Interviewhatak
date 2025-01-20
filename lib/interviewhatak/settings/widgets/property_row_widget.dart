import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/interviewhatak/settings/widgets/circular_avatar_icon_bg.dart';

class PropertyRowWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String title;
  const PropertyRowWidget(
      {super.key, required this.icon, required this.hint, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        CircularAvatarIconBg(icon: icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hint,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                    fontSize: 13.sp,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
