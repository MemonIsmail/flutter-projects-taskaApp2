import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/login_screen_controller.dart';
import 'package:taska_app/controllers/text_field_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class LoginScreen extends GetView<LoginScreenController>{
  final TextFieldController textFieldController = Get.put(TextFieldController());
  bool focus = false;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/AppLogo2.png',
                    height: 90,
                    width: 90,
                  ),
                ),

                SizedBox(height: Get.height*0.01,),
                CustomHeadingText(
                  text: 'Taska',
                  textColor: Colors.black,
                  textSize: 50
                ),

                SizedBox(height: Get.height*0.01,),
                CustomHeadingText(
                  text: 'Log in to your account',
                  textColor: Colors.black,
                  textSize: 25
                ),

                SizedBox(height: Get.height*0.04,),
                CustomTextField(
                  hintText: 'Username',
                  prefIcon: Icons.email,
                  onChanged: (value) => controller.userName.value = value,
                ),

                SizedBox(height: Get.height*0.03,),
                Obx(() =>
                  CustomTextField(
                    hintText: 'Password',
                    prefIcon: Icons.lock,
                    suffIcon: textFieldController.showPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility_rounded,
                    obscureText: textFieldController.showPassword.value,
                    onPressed: (){
                      textFieldController.showPassword.toggle();
                    },
                    onChanged: (value) => controller.password.value = value,
                  ),
                ),

                SizedBox(height: Get.height * 0.02,),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: (){
                          controller.login(
                            controller.userName.value,
                            controller.password.value
                          );
                        },
                        text: 'Log In',
                        buttonColor: kIndigoAccent,
                        textColor: kWhiteColor,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        controller.onCreatePressed();
                      },
                      child: Text(
                        'Create New',
                        style: TextStyle(
                            color: kIndigoAccent,
                            fontSize: 15
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}