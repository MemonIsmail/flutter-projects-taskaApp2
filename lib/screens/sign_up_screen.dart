import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/signup_screen_controller.dart';
import 'package:taska_app/controllers/text_field_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class SignUpScreen extends GetView<SignupScreenController>{
  final TextFieldController textFieldController = TextFieldController();
  @override
  Widget build(BuildContext context) {
    print(textFieldController.isEmailFocused);
    print('yes');
    // TODO: implement build
    return Scaffold(
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
                  isFocused: textFieldController.isNameFocused,
                  focusNode: textFieldController.nameFocusNode,
                  hintText: 'Full Name',
                  prefIcon: Icons.person,
                ),

                SizedBox(height: Get.height*0.02,),
                CustomDropDownMenu(
                  width: Get.width*0.9,
                  focusNode: textFieldController.roleFocusNode,
                  isFocused: textFieldController.isRoleFocused,
                ),

                SizedBox(height: Get.height*0.02,),
                CustomTextField(
                  isFocused: textFieldController.isEmailFocused,
                  focusNode: textFieldController.emailFocusNode,
                  hintText: 'Email',
                  prefIcon: Icons.email_rounded,
                ),

                SizedBox(height: Get.height*0.02,),
                Obx(() =>
                    CustomTextField(
                      hintText: 'Password',
                      prefIcon: Icons.lock,
                      suffIcon: textFieldController.showPassword.value
                          ? Icons.visibility_off
                          : Icons.visibility_rounded,
                      isFocused: textFieldController.isPassword2Focused,
                      focusNode: textFieldController.password2FocusNode,
                      obscureText: textFieldController.showPassword.value,
                      onPressed: (){
                        textFieldController.showPassword.toggle();
                      },
                    ),
                ),
                
                SizedBox(height: Get.height*0.02,),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: (){},
                        text: 'Create Account',
                        buttonColor: kIndigoAccent,
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
                            color: kIndigoAccent,
                            fontSize: 15
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}