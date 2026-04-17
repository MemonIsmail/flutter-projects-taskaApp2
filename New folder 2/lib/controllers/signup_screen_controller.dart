import 'package:get/get.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/user_model.dart';

import '../screens/screens_colors.dart';

class SignupScreenController extends GetxController{
  final UserLoginService _service = UserLoginService();

  RxBool showPassword = false.obs;

  void onSigninPressed(){
    Get.offNamed(kLoginScreenRoute);
  }

  Future<void> createAccount(String userName, String email, String password) async{

    String? error;

    UserModel user = UserModel(
      userName: userName,
      email: email,
      password: password,
    );

    try{
      error = validate(userName, password);
      if(error == null && validateEmail(email)){
        await _service.addUser(user);
        Get.snackbar(
          'Success', 'User Added Successfully',
          backgroundColor: kWhiteColor,
        );
        Get.offNamed(kLoginScreenRoute);
      }
      else{
        if(!validateEmail(email)){
          Get.snackbar(
            'Error', 'Email not Valid',
            backgroundColor: kWhiteColor,
          );
        }
        else{
          Get.snackbar(
            'Error', error!,
            backgroundColor: kWhiteColor,
          );
        }
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

  String? validate(String userName, String password){
    if(userName.trim().isEmpty || password.isEmpty) return 'Some Details are missing!!';

    if(password.length < 8) return 'Password should be greater than 8 characters';

    return null;
  }

  bool validateEmail(String email){
    List<String> invalidChars = ['!', '#', '\$', '%', '^', '&', '*', '(', ')', '+', '=', ',', '/', '?'];

    for(String char in invalidChars)
    {
      if(email.contains(char)) return false;
    }

    if(!email.contains('@')) return false;

    List<String> parts = email.split('@');

    if(parts.length != 2) return false;

    String local = parts[0];
    String domain = parts[1];

    if(local.isEmpty || domain.isEmpty) return false;
    
    if(!domain.contains('.')) return false;

    List<String> domainParts = domain.split('.');

    if(domainParts.length != 2) return false;

    if(domainParts[1].length < 2) return false;

    return true;
  }

}