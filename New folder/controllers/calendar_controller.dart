import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

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
}
