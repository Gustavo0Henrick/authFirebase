import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final controller;
  final size;
  final double height;
  final color;
  final String? Function(String?) function;
  final TextInputType inputType;
  final String hint;
  const CustomTextFieldWidget(
      {Key? key,
      this.controller,
      this.size,
      this.color = AppColors.white,
      required this.function,
      this.inputType = TextInputType.text,
      required this.hint,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      width: size,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          validator: function,
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
