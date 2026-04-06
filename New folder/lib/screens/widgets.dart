
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taska_app/controllers/dashboard_screen_controller.dart';
import 'package:taska_app/controllers/task_details_controller.dart';
import 'package:taska_app/model/task_details_model.dart';
import 'package:taska_app/screens/screens_colors.dart';

import '../controllers/calendar_controller.dart';

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
  final bool showIcon;
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
    this.suffixIconColor = kGreyColor,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    TaskDetailsController taskDetailsController = TaskDetailsController();
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
      showIcon
        ? Icon(
          icon,
          color: kGreyColor,
        )
        : null,
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
              color: kIndigoAccent,
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

class TaskDetails extends StatelessWidget {
  final String title;
  final String dueDate;
  final String priority;
  final String status;
  final String assignee;
  final String description;
  const TaskDetails(
      {
        super.key,
        required this.title,
        required this.dueDate,
        required this.priority,
        required this.status,
        required this.assignee,
        required this.description,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
          },
          child: Container(
            height: 120,
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
                              color: (status == 'In Progress') ? Color(0xFF8edd72) : (status == 'Pending') ? Color(0xFFffc045) : kIndigoAccent,
                              width: 1.5,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: (status == 'In Progress') ? Color(0xFF8edd72) : (status == 'Pending') ? Color(0xFFffc045) : kIndigoAccent,
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
                                color: (priority == 'High') ? Color(0xFFf25353) : Color(0xFF8edd72),
                              ),
                              Text(
                                priority,
                                style: TextStyle(
                                  color: (priority == 'High') ? Color(0xFFf25353) : Color(0xFF8edd72),
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
                      fontSize: 19,
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
                                '',
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
        ),
        SizedBox(height: 10,),
      ],
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

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(CalendarController());

    return Obx(() => TableCalendar(

      firstDay: DateTime.utc(1900),

      focusedDay: controller.theFocusedDay.value,
      lastDay: DateTime.utc(controller.theFocusedDay.value.year + 50),
      selectedDayPredicate: (day) =>
          isSameDay(controller.theSelectedDay.value, day),
      onDaySelected: controller.onDaySelected,
      calendarFormat: controller.calendarFormat.value,
      onFormatChanged: controller.onFormatChanged,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: const HeaderStyle(
        decoration: BoxDecoration(color: kWhiteColor),
        headerMargin: EdgeInsets.only(bottom: 10),
        titleTextStyle: TextStyle(
          fontSize: 18
        ),
        titleCentered: true,
        formatButtonVisible: false,
      ),
    ));
  }
}

class TaskSection extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String detail;
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
              title,
              style: TextStyle(
                color: kGreyColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              detail,
              style: TextStyle(
                color: kBlackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}




