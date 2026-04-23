import 'package:get/get.dart';
import 'package:taska_app/Controllers/splash_screen_controller.dart';
import 'package:taska_app/controllers/calendar_controller.dart';
import 'package:taska_app/controllers/login_screen_controller.dart';
import 'package:taska_app/controllers/signup_screen_controller.dart';
import 'package:taska_app/controllers/task_details_controller.dart';

import '../controllers/create_task_controller.dart';
import '../controllers/dashboard_screen_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => DashboardScreenController());
    Get.lazyPut(() => CreateTaskController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SignupScreenController());
    Get.lazyPut(() => TaskDetailsController());
    Get.lazyPut(() => CalendarController());
  }
}