import 'package:get/get.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/user_model.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreenController extends GetxController{
  final UserLoginService _service = UserLoginService();

  RxBool showPassword = true.obs;
  RxBool isLoading = false.obs;

  void onCreatePressed(){
    Get.offAllNamed(kSignupScreenRoute);
  }

  Future<void> login(String email, String password) async{
    try{
      isLoading(true);

      final user = await _service.loginUser(email, password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', user.userName);
      await prefs.setInt('id', user.id);
      Get.snackbar(
        'Success', 'Welcome: ${user.userName}',
        backgroundColor: kWhiteColor,
      );

      Get.offAllNamed(kDashboardScreenRoute);
    }
    catch(e){
      Get.snackbar(
        'Error', 'Invalid Details',
        backgroundColor: kWhiteColor,
      );
    } finally {
      isLoading(false);
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