import 'package:get/get.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/user_model.dart';

class LoginScreenController extends GetxController{
  final UserLoginService _service = UserLoginService();

  RxString userName = ''.obs;
  RxString password = ''.obs;

  void onLoginPressed(){

  }

  void onCreatePressed(){
    Get.offAllNamed(kSignupScreenRoute);
  }

  Future<void> login(String userName, String password) async{
    try{
      final user = await _service.getUserByName(userName, password);
      if(user!=null){
        Get.snackbar('Success', 'Welcome: ${user.userName}');
        Get.offAllNamed(kDashboardScreenRoute);
      }
      else{
        Get.snackbar('Error', 'Invalid Email or Password');
      }
    }
    catch(e){
      Get.snackbar('Error', 'Invalid UserName or Password');
    }
  }
}