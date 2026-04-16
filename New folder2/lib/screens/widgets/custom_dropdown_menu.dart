import 'package:flutter/material.dart';

import '../screens_colors.dart';

class CustomDropDownMenu extends StatelessWidget {
  final double width;
  final bool showIcon;
  final IconData? icon;
  final String hintText;
  final List<DropdownMenuEntry<String>> items;
  final ValueChanged<String?>? onSelected;
  const CustomDropDownMenu({
    super.key,
    required this.width,
    required this.items,
    this.showIcon = false,
    this.icon,
    required this.hintText,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: items,
      width: width,
      leadingIcon:
      showIcon ?
      Icon(
        icon,
        color: kGreyColor,
      ) : null,

      hintText: hintText,
      onSelected: onSelected,

      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.transparent
          )
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1.5,
          )
        ),

        filled: true,
        fillColor: kLightGreyColor,

        hintStyle: TextStyle(
          color: kGreyColor
        ),
      ),

      trailingIcon: Icon(
        Icons.arrow_drop_down_rounded,
        color: kGreyColor,
      ),

      selectedTrailingIcon: Icon(
        Icons.arrow_drop_up_rounded,
        color: kGreyColor,
      ),

      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all<Color>(kWhiteColor),
      ),
      menuHeight: 120,
    );
  }
}