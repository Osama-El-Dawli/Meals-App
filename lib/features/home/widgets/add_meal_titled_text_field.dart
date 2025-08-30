import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/app_colors.dart';

class AddMealTitledTextField extends StatelessWidget {
  const AddMealTitledTextField({
    super.key,
    required this.title,
    this.controller,
    this.maxLines,
    this.keyboardType,
  });
  final String title;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter this field';
            }
            return null;
          },
          keyboardType: keyboardType,
          onTapUpOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          maxLines: maxLines ?? 1,
          controller: controller,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: color ?? Colors.grey),
    );
  }
}
