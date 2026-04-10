import 'package:flutter/material.dart';

import '../screens_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool readOnly;
  final bool obscureText;
  final bool showIcon;
  final IconData? suffIcon;
  final IconData? prefIcon;
  final Function()? onPressed;
  final String hintText;
  final double borderRadius;
  final ValueChanged<String>? onChanged;
  final Color suffixIconColor;
  final Color borderColor;
  final double borderWidth;
  const CustomTextField({
    super.key,
    this.readOnly = false,
    this.textEditingController,
    this.onChanged,
    required this.hintText,
    this.obscureText=false,
    this.suffIcon,
    this.onPressed,
    this.prefIcon,
    this.borderRadius = 10,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.suffixIconColor = kGreyColor,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: kGreyColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: Colors.transparent,
              )
          ),
          suffixIcon: IconButton(
              icon: Icon(suffIcon),
              onPressed:onPressed
          ),
          suffixIconColor: suffixIconColor,
          prefixIcon: showIcon
              ? Icon(
            prefIcon,
            color: kGreyColor,
          )
              : null,
          filled: true,
          fillColor: kLightGreyColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 1.5,
              )
          )
      ),
      onChanged: onChanged,
      cursorColor: kBlackColor,
    );
  }
}