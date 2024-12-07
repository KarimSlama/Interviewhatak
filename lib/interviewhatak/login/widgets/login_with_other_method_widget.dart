import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class LoginWithOtherMethodWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  const LoginWithOtherMethodWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: AppColors.light,
      borderRadius: BorderRadiusDirectional.circular(20.0),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(
            Size(double.infinity, 50.h),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.light)),
      ),
    );

    // return SizedBox(
    //   width: double.infinity,
    //   height: 50.h,
    //   child: Material(
    //     elevation: 10.0,
    //     shadowColor: Colors.grey[200],
    //     borderRadius: BorderRadiusDirectional.circular(20.0),
    //     child: MaterialButton(
    //       onPressed: () {
    //         this.onPressed();
    //       },
    //       child: Text(
    //         text,
    //       ),
    //     ),
    //   ),
    // );
  }
}
