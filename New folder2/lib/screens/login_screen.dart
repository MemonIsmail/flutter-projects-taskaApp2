import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/login_screen_controller.dart';
import 'package:taska_app/model/user_model.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets/custom_button.dart';
import 'package:taska_app/screens/widgets/custom_heading_text.dart';
import 'package:taska_app/screens/widgets/custom_text_field.dart';

class LoginScreen extends GetView<LoginScreenController>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final List<UserModel> users = [];
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                    textColor: kBlackColor,
                    textSize: 50
                  ),

                  SizedBox(height: Get.height*0.01,),
                  CustomHeadingText(
                    text: 'Log in to your account',
                    textColor: kBlackColor,
                    textSize: 25
                  ),

                  SizedBox(height: Get.height*0.04,),
                  CustomTextField(
                    textEditingController: emailController,
                    showIcon: true,
                    hintText: 'Email',
                    prefIcon: Icons.email,
                  ),

                  SizedBox(height: Get.height*0.03,),
                  Obx(() =>
                    CustomTextField(
                      textEditingController: passwordController,
                      showIcon: true,
                      hintText: 'Password',
                      prefIcon: Icons.lock,
                      suffIcon: controller.showPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility_rounded,
                      obscureText: controller.showPassword.value,
                      onPressed: (){
                        controller.showPassword.toggle();
                      },
                    ),
                  ),

                  SizedBox(height: Get.height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => controller.isLoading.value
                          ? const CircularProgressIndicator(
                        color: kPrimaryColor,
                        strokeWidth: 4,
                      )
                      : Expanded(
                        child:
                        CustomButton(
                            onPressed: () async {
                              controller.login(
                                emailController.text.trim().toLowerCase(),
                                passwordController.text.trim().toLowerCase()
                              );
                            },
                            text: 'Log In',
                            buttonColor: kPrimaryColor,
                            textColor: kWhiteColor,
                          ),
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
                          // controller.onCreatePressed();
                        },
                        child: Text(
                          'Create New',
                          style: TextStyle(
                              color: kPrimaryColor,
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
      ),
    );
  }
}