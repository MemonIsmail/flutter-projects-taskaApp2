import 'package:get/get.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/user_model.dart';

import '../screens/screens_colors.dart';

class SignupScreenController extends GetxController{
  final UserLoginService _service = UserLoginService();

  RxString userName = ''.obs;
  RxString email = ''.obs;
  RxString role = ''.obs;
  RxString password = ''.obs;

  late UserModel user = UserModel(
    userName: userName.value,
    email: email.value,
    role: role.value,
    password: password.value,
  );

  void onSigninPressed(){
    Get.offNamed(kLoginScreenRoute);
  }

  Future<void> createAccount(UserModel newUser) async{
    String? error;
    try{
      error = validate(userName.value,role.value, email.value, password.value);
      if(error == null){
        await _service.addUser(newUser);
        Get.snackbar(
          'Success', 'User Added Successfully',
          backgroundColor: kWhiteColor,
        );
        Get.offNamed(kLoginScreenRoute);
      }
      else{
        Get.snackbar(
          'Error', error,
          backgroundColor: kWhiteColor,
        );
      }
    }
    catch(e){
      Get.snackbar(
        'Error', 'User Already Exists',
        backgroundColor: kWhiteColor,
      );
      Get.offNamed(kLoginScreenRoute);
    }
  }
  String? validate(String userName,String role, String email, String password){
    if(userName.trim().isEmpty || role.trim().isEmpty || email.trim().isEmpty || password.isEmpty)
    {
      return 'Some Details are missing!!';
    }
    if(!email.contains('@'))
    {
      return 'Please enter a valid Email..';
    }
    if(password.length < 8)
    {
      return 'Password should be gretaer than 8 characters';
    }
    return null;
  }
}