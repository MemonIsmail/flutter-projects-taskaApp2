import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../screens/screens_colors.dart';
import '../screens/widgets.dart';

class CalendarController extends GetxController {

  RxBool isVisible = false.obs;

  var theFocusedDay = DateTime.now().obs;
  var theSelectedDay = DateTime.now().obs;
  var calendarFormat = CalendarFormat.month.obs;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    theSelectedDay.value = selectedDay;
    theFocusedDay.value = focusedDay;
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat.value = format;
  }

  void toggleCalendar(){
    isVisible.value = !isVisible.value;
  }

  void showCalendar(){
    Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      backgroundColor: kWhiteColor,
      content: CustomCalendar(),
      radius: 15,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: (){
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                )
            ),
            TextButton(
                onPressed: (){
                  Get.back();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                )
            )
          ],
        ),
      ],
    );
  }
}
