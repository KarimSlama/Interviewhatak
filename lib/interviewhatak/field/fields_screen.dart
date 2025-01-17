import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/interviewhatak/field/widget/field_bloc_builder.dart';

class AnimatedFieldScreen extends StatelessWidget {
  final String categoryName;
  const AnimatedFieldScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toString()),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(IconBroken.Arrow___Left)),
      ),
      body: FieldBlocBuilder(),
    );
  }
}
