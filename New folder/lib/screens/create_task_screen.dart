import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/task_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class CreateTaskScreen extends GetView<TaskScreenController>{
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(text: 'Title'),

              SizedBox(height: Get.height*0.01,),
              CustomTextField(
                hintText: 'Enter',
                onChanged: (value) => controller.title.value = value,
              ),

              SizedBox(height: Get.height*0.03,),
              LabelText(text: 'Due Date'),

              SizedBox(height: Get.height*0.01,),
              CustomTextField(
                hintText: 'Select',
                suffIcon: Icons.calendar_month_rounded,
                onPressed: (){
                  controller.showCalendar();
                },
              ),

              SizedBox(height: Get.height*0.03,),
              LabelText(text: 'Priority'),

              SizedBox(height: Get.height*0.01,),
              CustomDropDownMenu(
                hintText: 'Select',
                onSelected: (value) => controller.title.value = value ?? '',
                width: Get.width*0.9,
                items: [
                  DropdownMenuEntry(value: 'value1', label: 'Low'),
                  DropdownMenuEntry(value: 'value2', label: 'Normal'),
                  DropdownMenuEntry(value: 'value3', label: 'High'),
                ]
              ),

              SizedBox(height: Get.height*0.03,),
              LabelText(text: 'Status'),

              SizedBox(height: Get.height*0.01,),
              CustomDropDownMenu(
                hintText: 'Select',
                  onSelected: (value) => controller.status.value = value ?? '',
                width: Get.width*0.9,
                items: [
                  DropdownMenuEntry(value: 'value1', label: 'Pending'),
                  DropdownMenuEntry(value: 'value2', label: 'In Progress'),
                  DropdownMenuEntry(value: 'value3', label: 'Completed'),
                ]
              ),

              SizedBox(height: Get.height*0.03,),
              LabelText(text: 'Assignee'),

              SizedBox(height: Get.height*0.01,),
              CustomDropDownMenu(
                hintText: 'Select',
                  onSelected: (value) => controller.assignee.value = value ?? '',
                width: Get.width*0.9,
                items: [
                  DropdownMenuEntry(value: 'value1', label: 'Bilawal Mehmood'),
                  DropdownMenuEntry(value: 'value2', label: 'Ismail Memon'),
                ]
              ),

              SizedBox(height: Get.height*0.03,),
              LabelText(text: 'Description'),

              SizedBox(height: Get.height*0.01,),
              CustomTextField(hintText: 'Enter Description'),

              SizedBox(height: Get.height*0.03,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        controller.submitTask();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kIndigoAccent,
                        foregroundColor: kWhiteColor,
                      ),
                      child: Text('Create Task'),
                    )
                  )
                ],
              ),
              SizedBox(height: Get.height*0.05,),
            ],
          ),
        ),
      ),
    );
  }
}