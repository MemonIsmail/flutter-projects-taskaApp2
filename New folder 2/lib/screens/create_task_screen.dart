import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taska_app/controllers/calendar_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets/custom_dropdown_menu.dart';
import 'package:taska_app/screens/widgets/custom_heading_text.dart';
import 'package:taska_app/screens/widgets/custom_text_field.dart';
import 'package:taska_app/screens/widgets/label_text.dart';

import '../controllers/create_task_controller.dart';

class CreateTaskScreen extends GetView<CreateTaskController>{
  final calendarController = Get.find<CalendarController>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          title: CustomHeadingText(
            text: 'Create New Task',
            textColor: kBlackColor,
            textSize: 20
          ),
          titleSpacing: 0,
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
                  textEditingController: titleController,
                  hintText: 'Enter',
                ),

                SizedBox(height: Get.height*0.03,),
                LabelText(text: 'Due Date'),

                SizedBox(height: Get.height*0.01,),
                Obx((){
                  String formattedDate = DateFormat('d-M-yyyy').format(calendarController.theFocusedDay.value);
                  controller.dueDate.value = formattedDate;
                  return CustomTextField(
                    key: Key(formattedDate),
                    textEditingController: TextEditingController(text: controller.dueDate.value),
                    readOnly: true,
                    hintText: '',
                    suffIcon: Icons.calendar_month_rounded,
                    onPressed: (){
                      calendarController.showCalendar();
                    },
                    onChanged: (value) => controller.dueDate.value = value,
                  );
                  }
                ),

                SizedBox(height: Get.height*0.03,),
                LabelText(text: 'Priority'),

                SizedBox(height: Get.height*0.01,),
                CustomDropDownMenu(
                  hintText: 'Select',
                  onSelected: (value) => controller.priority = value ?? '',
                  width: Get.width*0.9,
                  items: [
                    DropdownMenuEntry(value: 'Low', label: 'Low'),
                    DropdownMenuEntry(value: 'Normal', label: 'Normal'),
                    DropdownMenuEntry(value: 'High', label: 'High'),
                  ]
                ),

                SizedBox(height: Get.height*0.03,),
                LabelText(text: 'Status'),

                SizedBox(height: Get.height*0.01,),
                CustomDropDownMenu(
                  hintText: 'Select',
                  onSelected: (value) => controller.status = value ?? '',
                  width: Get.width*0.9,
                  items: [
                    DropdownMenuEntry(value: 'Pending', label: 'Pending'),
                    DropdownMenuEntry(value: 'In Progress', label: 'In Progress'),
                    DropdownMenuEntry(value: 'Completed', label: 'Completed'),
                  ]
                ),

                SizedBox(height: Get.height*0.03,),
                LabelText(text: 'Description'),

                SizedBox(height: Get.height*0.01,),
                CustomTextField(
                  textEditingController: descriptionController,
                  hintText: 'Enter Description',
                ),

                SizedBox(height: Get.height*0.03,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          controller.createTask(
                            titleController.text,
                            descriptionController.text,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
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
      ),
    );
  }
}