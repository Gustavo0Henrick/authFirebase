import 'package:auth_firebase/src/core/themes/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPasswordfieldWidget extends StatefulWidget {
  final controller;
  final size;
  final double height;
  final color;
  final String? Function(String?) function;
  final TextInputType inputType;
  final String hint;
  const CustomPasswordfieldWidget(
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
  _CustomPasswordfieldWidgetState createState() =>
      _CustomPasswordfieldWidgetState();
}

class _CustomPasswordfieldWidgetState extends State<CustomPasswordfieldWidget> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.color,
      ),
      width: widget.size,
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          obscureText: obscure,
          validator: (value) {},
          keyboardType: widget.inputType,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: Icon(obscure ? Icons.visibility_off : Icons.visibility)),
            border: InputBorder.none,
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}
