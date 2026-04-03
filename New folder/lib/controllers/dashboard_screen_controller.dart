import 'package:get/get.dart';
import 'package:taska_app/model/constants.dart';

class DashboardScreenController extends GetxController{

  void onLogOutPressed(){
    Get.offAllNamed(kLoginScreenRoute);
  }

  void onCreateTaskPressed(){
    Get.toNamed(kTaskScreenRoute);
  }
}