import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/calendar_controller.dart';
import 'package:taska_app/controllers/task_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class TaskScreen extends GetView<TaskScreenController>{
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TaskDetails> tasks;
    final calendarController = Get.put(CalendarController());
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
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(text: 'Title'),

              SizedBox(height: Get.height*0.01,),
              CustomTextField(hintText: 'Enter'),

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
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kIndigoAccent,
                          foregroundColor: kWhiteColor,
                          // elevation: 0.0
                        ),
                        child: Text('Create Task'),
                      )
                  )
                ],
              ),
              SizedBox(height: Get.height*0.05,),

              // Obx(() => calendarController.isVisible.value
              //     ? CustomCalendar()
              //     : SizedBox.shrink()
              // ),

            ],
          ),
        ),
      ),
    );
  }

}