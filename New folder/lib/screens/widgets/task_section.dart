import 'package:flutter/material.dart';

import '../screens_colors.dart';

class TaskSection extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String? title;
  final String? detail;
  const TaskSection({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 25,
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: TextStyle(
                color: kGreyColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              detail!,
              style: TextStyle(
                color: kBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}