import 'package:flutter/material.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

class TextInputFieldsWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintName;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final FormFieldValidator<String> validate;
  final bool isObsecureText;

  const TextInputFieldsWidget({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.hintName,
    required this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    required this.validate,
    this.isObsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 7,
          shadowColor: AppColors.light,
          borderRadius: BorderRadiusDirectional.circular(20),
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: isObsecureText,
            validator: (value) {
              return validate(value);
            },
            decoration: InputDecoration(
              hintText: hintName,
              prefixIcon: Icon(prefixIcon),
              suffixIcon: IconButton(
                onPressed: onPressed != null ? () => onPressed : null,
                icon: Icon(suffixIcon),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        verticalSpace(20),
      ],
    );
  }
}
