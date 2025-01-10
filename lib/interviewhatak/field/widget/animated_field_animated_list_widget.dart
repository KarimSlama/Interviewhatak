import 'package:flutter/material.dart';
import 'package:interviewhatak/interviewhatak/field/data/model/fields_model.dart';
import 'package:interviewhatak/interviewhatak/field/widget/animated_field_list_item.dart';

class AnimatedFieldAnimatedListWidget extends StatelessWidget {
  final GlobalKey<AnimatedListState> listKey;
  final List<FieldsModel> fields;
  const AnimatedFieldAnimatedListWidget(
      {super.key, required this.listKey, required this.fields});

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: fields.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index, animation) {
        return AnimatedFieldListItem(
          fieldsModel: fields[index],
          animation: animation,
        );
      },
    );
  }
}
