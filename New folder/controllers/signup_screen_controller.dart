import 'package:get/get.dart';
import 'package:taska_app/model/constants.dart';

class SignupScreenController extends GetxController{
  void onSigninPressed(){
    Get.offNamed(kLoginScreenRoute);
  }
}