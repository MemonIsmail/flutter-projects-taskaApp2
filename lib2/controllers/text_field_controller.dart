import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController{

  RxBool showPassword = false.obs;

  RxBool isUsernameFocused = false.obs;
  RxBool isPasswordFocused = false.obs;
  RxBool isPassword2Focused = false.obs;
  RxBool isNameFocused = false.obs;
  RxBool isRoleFocused = false.obs;
  RxBool isEmailFocused = false.obs;

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode password2FocusNode = FocusNode();
  FocusNode roleFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();

    usernameFocusNode.addListener((){
      isUsernameFocused.value = usernameFocusNode.hasFocus;
    });

    passwordFocusNode.addListener((){
      isPasswordFocused.value = passwordFocusNode.hasFocus;
    });

    password2FocusNode.addListener((){
      isPassword2Focused.value = password2FocusNode.hasFocus;
    });

    roleFocusNode.addListener((){
      isRoleFocused.value = roleFocusNode.hasFocus;
    });

    emailFocusNode.addListener((){
      isEmailFocused.value = emailFocusNode.hasFocus;
    });

    nameFocusNode.addListener((){
      isNameFocused.value = nameFocusNode.hasFocus;
    });
  }

}