import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/interviewhatak/contact_us/widget/contact_row_widget.dart';

class ContactWidgets extends StatelessWidget {
  const ContactWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        ContactRowWidget(title: 'Cairo, Egypt', icon: IconBroken.Location),
        ContactRowWidget(title: '+20 1095856941', icon: IconBroken.Call),
        ContactRowWidget(
            title: 'karimslama917@gmail.com', icon: IconBroken.Message),
      ],
    );
  }
}
