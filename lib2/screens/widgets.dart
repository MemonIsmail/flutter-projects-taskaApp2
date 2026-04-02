import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/screens/screens_colors.dart';

class CustomHeadingText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  const CustomHeadingText({super.key, required this.text,required this.textColor, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final IconData? suffIcon;
  final IconData? prefIcon;
  final Function()? onPressed;
  final Function()? onTap;
  final String hintText;
  final double borderRadius;
  final ValueChanged<String>? onChanged;
  final bool fill;
  final Color filColor;
  final Color hintColor;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final Color borderColor;
  final double borderWidth;
  const CustomTextField({
    super.key,
    this.onChanged,
    required this.hintText,
    this.obscureText=false,
    this.suffIcon,
    this.onPressed,
    this.onTap,
    this.prefIcon,
    this.borderRadius = 10,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.fill = false,
    this.filColor = kWhiteColor,
    this.hintColor = kGreyColor,
    this.prefixIconColor = kGreyColor,
    this.suffixIconColor = kGreyColor
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
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
          prefixIcon: Icon(
            prefIcon,
            color: kGreyColor
          ),
          filled: true,
          fillColor: kLightGreyColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: kIndigoAccent,
                width: 1.5,
              )
          )
      ),
      onChanged: onChanged,
      onTap: onTap,
      cursorColor: kBlackColor,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function() onPressed;
  const CustomElevatedButton({super.key, required this.text, required this.buttonColor, required this.textColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: textColor,
        // elevation: 0.0
      ),
      child: Text(text),
    );
  }
}

class CustomDropDownMenu extends StatelessWidget {
  final double width;
  final RxBool isFocused;
  final FocusNode focusNode;
  const CustomDropDownMenu({super.key, required this.width, required this.focusNode, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      bool focused = isFocused.value;
      return DropdownMenu(
        focusNode: focusNode,
        dropdownMenuEntries: <DropdownMenuEntry<String>>[
          DropdownMenuEntry(value: 'item1', label: 'Student'),
          DropdownMenuEntry(value: 'item2', label: 'Teacher'),
        ],
        width: width,
        leadingIcon: Icon(
          Icons.person,
          color: kGreyColor,
        ),
        hintText: 'Select role',
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
                color: kIndigoAccent,
                width: 1.5,
              )
          ),
          filled: true,
          fillColor: focused
              ? kWhiteColor
              : kLightGreyColor,
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
    });
  }
}

class TaskDetails extends StatelessWidget {
  final String title;
  final String progress;
  final String priority;
  final String assignee;
  final String date;
  const TaskDetails({
    super.key,
    required this.title,
    required this.progress,
    required this.priority,
    required this.assignee,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: (progress == 'In Progress') ? Colors.greenAccent : (progress == 'Pending') ? Colors.yellow : kIndigoAccent,
                          width: 1.5,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        progress,
                        style: TextStyle(
                          color: (progress == 'In Progress') ? Colors.greenAccent : (progress == 'Pending') ? Colors.yellow : kIndigoAccent,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flag,
                            color: (priority == 'High') ? Colors.red[600] : Colors.greenAccent,
                          ),
                          Text(
                            priority,
                            style: TextStyle(
                              color: (priority == 'High') ? Colors.red[600] : Colors.greenAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  color: kIndigoAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: kGreyColor,
                            size: 20,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            assignee,
                            style: TextStyle(
                              color: kGreyColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: kGreyColor,
                            size: 20,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            date,
                            style: TextStyle(
                                color: kGreyColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: kBlackColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
