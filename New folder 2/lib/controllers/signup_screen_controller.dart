import 'package:get/get.dart';
import 'package:taska_app/firebase/services/user_services.dart';
import 'package:taska_app/routing/routes.dart';
import 'package:taska_app/model/user_model.dart';

import '../screens/screens_colors.dart';

class SignupScreenController extends GetxController{
  final UserServices _firebaseServices = UserServices();

  RxBool showPassword = false.obs;
  RxString currentRole = ''.obs;
  RxBool isLoading = false.obs;

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
      isLoading(true);
      error = await _firebaseServices.addUser(user);
      if(error == 'User added Successfully'){
        Get.offAllNamed(kLoginScreenRoute);
        Get.snackbar('Success', error);
      }
      else{
        Get.snackbar(
          'Error', error,
          backgroundColor: kWhiteColor,
        );
      }
    } catch(e){
      Get.snackbar('Error', 'Some error occurred');
    } finally{
      isLoading(false);
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