import 'package:get/get.dart';
import 'package:taska_app/model/constants.dart';

class DashboardScreenController extends GetxController{

  void onLogOutPressed(){
    Get.offNamed(kLoginScreenRoute);
  }

  void onCreateTaskPressed(){
    Get.toNamed(kTaskScreenRoute);
  }

  void onTaskPressed(){
    Get.toNamed(kTaskDetailsScreenRoute);
  }
}