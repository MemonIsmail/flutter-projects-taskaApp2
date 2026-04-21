
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/signup_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets/custom_button.dart';
import 'package:taska_app/screens/widgets/custom_dropdown_menu.dart';
import 'package:taska_app/screens/widgets/custom_heading_text.dart';
import 'package:taska_app/screens/widgets/custom_text_field.dart';

class SignUpScreen extends GetView<SignupScreenController>{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final dbReference = FirebaseFirestore.instance.collection('users');

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
        ),
        backgroundColor: kWhiteColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                    textColor:
                    kBlackColor, textSize: 50
                  ),

                  SizedBox(height: Get.height*0.01,),
                  CustomHeadingText(
                    text: 'Create New Account',
                    textColor:
                    kBlackColor, textSize: 25
                  ),

                  SizedBox(height: Get.height*0.05,),
                  CustomTextField(
                    textEditingController: nameController,
                    showIcon: true,
                    hintText: 'Full Name',
                    prefIcon: Icons.person,
                  ),

                  SizedBox(height: Get.height*0.02,),
                  CustomDropDownMenu(
                    showIcon: true,
                    icon: Icons.manage_accounts,
                    hintText: 'Select Role',
                    width: Get.width*0.9,
                    items: [
                      DropdownMenuEntry(value: 'item1', label: 'Teacher'),
                      DropdownMenuEntry(value: 'item2', label: 'Student'),
                    ],
                    onSelected: (value) => controller.currentRole.value = value ?? '',
                  ),

                  SizedBox(height: Get.height*0.02,),
                  CustomTextField(
                    textEditingController: emailController,
                    showIcon: true,
                    hintText: 'Email',
                    prefIcon: Icons.email_rounded,
                  ),

                  SizedBox(height: Get.height*0.02,),
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

                  SizedBox(height: Get.height*0.02,),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: (){
                            controller.createAccount(
                              nameController.text,
                              emailController.text,
                              // controller.currentRole.value,
                              passwordController.text
                            );
                          },
                          text: 'Create Account',
                          buttonColor: kPrimaryColor,
                          textColor: kWhiteColor
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Get.height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: 15,
                        ),
                      ),

                      TextButton(
                        onPressed: (){
                          controller.onSigninPressed();
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Get.height*0.03,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
