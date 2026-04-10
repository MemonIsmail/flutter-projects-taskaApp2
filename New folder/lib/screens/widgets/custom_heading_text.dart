import 'package:flutter/material.dart';

import '../screens_colors.dart';

class CustomHeadingText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  const CustomHeadingText({super.key,required this.text, this.textColor = kBlackColor, this.textSize = 15});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: FontWeight.bold
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}