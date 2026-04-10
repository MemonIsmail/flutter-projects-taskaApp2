import 'package:get/get.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/screens/screens_colors.dart';

class LoginScreenController extends GetxController{
  final UserLoginService _service = UserLoginService();

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;

  void onCreatePressed(){
    Get.offAllNamed(kSignupScreenRoute);
  }

  Future<void> login(String email, String password) async{
    try{
      final user = await _service.getUserByName(email, password);
      if(user!=null){
        Get.snackbar(
          'Success', 'Welcome: ${user.userName}',
          backgroundColor: kWhiteColor,
        );
        name.value = user.userName;
        Get.offAllNamed(kDashboardScreenRoute);
      }
      else{
        Get.snackbar(
          'Error', 'Invalid Email or Password',
          backgroundColor: kWhiteColor,
        );
      }
    }
    catch(e){
      Get.snackbar(
        'Error', 'Invalid UserName or Password',
        backgroundColor: kWhiteColor,
      );
    }
  }

  Future<void> deleteAllUsers() async{
    try{
      await _service.deleteUsers();
      Get.snackbar(
        'Success', 'Deleted all Users',
        backgroundColor: kWhiteColor,
      );
    } catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    }
  }
}