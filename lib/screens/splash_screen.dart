import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/Controllers/splash_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kIndigoAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/AppLogo.png',
              height: 80,
              width: 80,
            ),
          ),
          SizedBox(height: Get.height*0.01,),
          Center(
            child: CustomHeadingText(text: 'Taska', textColor: kWhiteColor, textSize: 50)
          ),
        ],
      ),
    );
  }
}