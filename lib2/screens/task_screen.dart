import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/task_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class TaskScreen extends GetView<TaskScreenController>{
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: CustomHeadingText(
          text: 'Create New Task',
          textColor: kBlackColor,
          textSize: 20
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(text: 'Title'),
            CustomTextField(hintText: 'Enter'),
          ],
        ),
      ),
    );
  }

}