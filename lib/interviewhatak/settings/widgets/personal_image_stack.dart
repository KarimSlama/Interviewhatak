import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class PersonalImageStack extends StatelessWidget {
  final String image;
  const PersonalImageStack({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color(0xffD5C3AD),
          child: CircleAvatar(
            radius: 37,
            backgroundImage: NetworkImage(image),
          ),
        ),
        CircleAvatar(
          radius: 15,
          backgroundColor: AppColors.white,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              IconBroken.Edit,
              size: 16.sp,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
