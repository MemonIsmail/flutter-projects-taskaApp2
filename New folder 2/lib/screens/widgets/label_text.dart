import 'package:flutter/material.dart';

import '../screens_colors.dart';

class LabelText extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  const LabelText({super.key, required this.text, this.textSize = 15, this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: kBlackColor,
        fontSize: textSize,
        fontWeight: fontWeight,
      ),
    );
  }
}