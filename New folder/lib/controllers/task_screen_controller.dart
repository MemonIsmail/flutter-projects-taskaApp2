import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class TaskScreenController extends GetxController{
  void showCalendar(){
    Get.defaultDialog(
      title:'',
      titlePadding: EdgeInsets.zero,
      backgroundColor: kWhiteColor,
      content: CustomCalendar(),
      radius: 15,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: (){
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: kIndigoAccent,
                  ),
                )
            ),
            TextButton(
                onPressed: (){
                  Get.back();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: kIndigoAccent,
                  ),
                )
            )
          ],
        ),
      ],
    );
  }
}