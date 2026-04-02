import 'package:get/get.dart';
import 'package:taska_app/model/constants.dart';

class LoginScreenController extends GetxController{

  void onLoginPressed(){
    Get.offAllNamed(kDashboardScreenRoute);
  }

  void onCreatePressed(){
    Get.offAllNamed(kSignupScreenRoute);
  }
}