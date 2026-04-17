import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taska_app/controllers/calendar_controller.dart';

import '../screens_colors.dart';

class CustomCalendar extends GetView<CalendarController> {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {

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
      headerStyle: HeaderStyle(
        decoration: const BoxDecoration(color: kWhiteColor),
        headerMargin: const EdgeInsets.only(bottom: 10),
        titleTextStyle: const TextStyle(
          fontSize: 18
        ),
        titleCentered: true,
        formatButtonVisible: false,
        titleTextFormatter: (date, locale) =>
        "${date.day} ${DateFormat.MMMM(locale).format(date)} ${date.year}",
      ),
    ));
  }
}