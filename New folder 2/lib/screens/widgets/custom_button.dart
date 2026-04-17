import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function() onPressed;
  final double? elevation;
  const CustomButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: textColor,
        elevation: elevation,
      ),
      child: Text(text),
    );
  }
}