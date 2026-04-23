import 'package:get/get.dart';
import 'package:taska_app/firebase/services/user_services.dart';
import 'package:taska_app/model/user_model.dart';
import 'package:taska_app/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreenController extends GetxController{

  final UserServices _firebaseServices = UserServices();

  RxBool showPassword = true.obs;
  RxBool isLoading = false.obs;
  RxString userName = ''.obs;
  String userID = '';

  void onCreatePressed(){
    Get.offAllNamed(kSignupScreenRoute);
  }

  Future<void> login(String email, String password) async{
    try{
      isLoading(true);

      final UserModel user = await _firebaseServices.login(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', user.userName);
      await prefs.setString('userId', user.id);
      userName.value = prefs.getString('userName') ?? '';
      Get.snackbar('Success', 'Welcome, ${userName.value}');
      Get.offNamed(kDashboardScreenRoute);
    } catch(e){
      Get.snackbar('Error', e.toString().replaceAll('Exception: ', ''));
    } finally{
      isLoading(false);
    }
  }
}