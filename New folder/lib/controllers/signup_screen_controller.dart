import 'package:get/get.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/user_model.dart';

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
    try{
      await _service.addUser(newUser);
      Get.snackbar('Success', 'User Added Successfully');
      Get.offNamed(kLoginScreenRoute);
    }
    catch(e){
      Get.snackbar('Error', 'User Already Exists');
      Get.offNamed(kLoginScreenRoute);
    }
  }
}