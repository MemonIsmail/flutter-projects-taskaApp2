import 'dart:async';

import 'package:get/get.dart';
import 'package:taska_app/model/constants.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    toLoginScreen();
  }

  Future<void> toLoginScreen() async{
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(kLoginScreenRoute);
  }
}