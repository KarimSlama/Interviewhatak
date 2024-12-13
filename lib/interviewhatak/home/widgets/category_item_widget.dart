import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 150.w,
                height: 160.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      bottomEnd: Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/interviewhatak.appspot.com/o/categories%2Fimage_picker7557090985740498091.jpg?alt=media&token=34975fc1-0606-4c7a-959a-e8e7919a7ee4",
                    ),
                  ),
                ),
              ),
              verticalSpace(10),
              Text('Programming'),
            ],
          ),
        ],
      ),
    );
  }
}
