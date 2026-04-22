import 'package:get/get.dart';
import 'package:taska_app/database/services/firebase/firebase_services.dart';
import 'package:taska_app/database/services/local/local_user_services.dart';
import 'package:taska_app/database/services/web/web_user_services.dart';
import 'package:taska_app/routing/routes.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreenController extends GetxController{

  final LocalUserServices _localUserServices = LocalUserServices();
  final WebUserServices _webUserServices = WebUserServices();
  final FirebaseServices _firebaseServices = FirebaseServices();

  RxBool showPassword = true.obs;
  RxBool isLoading = false.obs;

  void onCreatePressed(){
    Get.offAllNamed(kSignupScreenRoute);
  }

  Future<void> login(String email, String password) async{

    final result = await _firebaseServices.login(email: email, password: password);

    if(result.containsKey('error')){
      Get.snackbar('Error', result['error']);
    }
    else{
      Get.snackbar('Success', '${result['user']['userName']}');
      Get.offAllNamed(kDashboardScreenRoute);
    }
  }

  // Future<void> login(String email, String password) async{
  //   try{
  //     isLoading(true);
  //
  //     if(email.isEmpty || password.isEmpty){
  //       Get.snackbar('Error', 'Please fill in the Details');
  //       return;
  //     }
  //
  //     final user = await _webUserServices.loginUser(email, password);
  //
  //     if(user == null) {
  //       Get.snackbar(
  //         'Error', 'Invalid Details..',
  //         backgroundColor: kWhiteColor,
  //       );
  //       return;
  //     }
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('userName', user.userName);
  //     await prefs.setInt('id', user.id);
  //     Get.offAllNamed(kDashboardScreenRoute);
  //   }
  //   catch(e){
  //     Get.snackbar(
  //       'Error', 'Invalid Details',
  //       backgroundColor: kWhiteColor,
  //     );
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> deleteAllUsers() async{
    try{
      await _localUserServices.deleteUsers();
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