import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/interviewhatak/field/data/model/fields_model.dart';

class AnimatedFieldListItem extends StatelessWidget {
  final FieldsModel fieldsModel;
  final Animation<double> animation;

  const AnimatedFieldListItem(
      {super.key, required this.fieldsModel, required this.animation});

  @override
  Widget build(BuildContext context) {
    String colorString = fieldsModel.color;
    int colorInt = int.parse("0xFF$colorString");
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(colorInt),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fieldsModel.fieldName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  Text('11', style: const TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
