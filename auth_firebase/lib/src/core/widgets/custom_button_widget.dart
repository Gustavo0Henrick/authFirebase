import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final color;
  final textStyle;
  final onPressed;
  final hint;
  const CustomButtonWidget(
      {Key? key, this.color, this.onPressed, this.hint, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Text(
        hint,
        style: textStyle,
      ),
    );
  }
}
