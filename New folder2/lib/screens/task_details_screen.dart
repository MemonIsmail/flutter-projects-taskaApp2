import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taska_app/controllers/calendar_controller.dart';
import 'package:taska_app/controllers/task_details_controller.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets/custom_button.dart';
import 'package:taska_app/screens/widgets/custom_dropdown_menu.dart';
import 'package:taska_app/screens/widgets/custom_heading_text.dart';
import 'package:taska_app/screens/widgets/label_text.dart';
import 'package:taska_app/screens/widgets/task_section.dart';

class TaskDetailsScreen extends GetView<TaskDetailsController>{
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final calendarController = Get.find<CalendarController>();

    final args = Get.arguments as Map<String, dynamic>;

    final int id = args['id'];
    final String title = args['title'];
    final String status = args['status'];
    final String priority = args['priority'];
    final String assignee = args['assignee'];
    final String dueDate = args['dueDate'];

    // controller.selectedStatus.value = status;
    // controller.selectedPriority.value = priority;
    // controller.selectedAssignee.value = assignee;
    // controller.selectedDate.value = dueDate;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: CustomHeadingText(text: 'Task Details', textColor: kBlackColor, textSize: 20),
        titleSpacing: 0,
      ),
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.09,
              child: CustomHeadingText(
                text: title,
                textColor:
                kPrimaryColor,
                textSize: 23,
              ),
            ),
            SizedBox(height: Get.height * 0.03,),
            Obx((){
              final bool isEditable = controller.isEditable.value;

              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      // if(isEditable) {
                      //   showModalBottomSheet(
                      //     context: context,
                      //     showDragHandle: true,
                      //     backgroundColor: kWhiteColor,
                      //     builder: (context){
                      //       return Column(
                      //         children: [
                      //           CustomHeadingText(
                      //             text: 'Status',
                      //             textSize: 25,
                      //           ),
                      //
                      //           SizedBox(height: 10,),
                      //           _divider(),
                      //
                      //           _listTile('Status', 'Pending'),
                      //           _divider(),
                      //
                      //           _listTile('Status', 'In Progress'),
                      //           _divider(),
                      //
                      //           _listTile('Status', 'Completed'),
                      //         ],
                      //       );
                      //     }
                      //   );
                      // }
                    },
                    child:
                    TaskSection(
                      icon: Icons.radio_button_checked,
                      title: 'Status', detail: status,
                      iconColor: (status == 'Completed') ? kPrimaryColor
                        : kGreenColor
                    ),
                  ),

                  SizedBox(height: Get.height * 0.01,),
                  Row(
                    children: [
                      Expanded(child: Divider(
                        color: kLightGreyColor2,
                        thickness: 1,
                      ))
                    ],
                  ),

                  SizedBox(height: Get.height * 0.01,),
                  GestureDetector(
                    onTap: (){
                      // if(isEditable) {
                      //   showModalBottomSheet(
                      //     context: context,
                      //     showDragHandle: true,
                      //     backgroundColor: kWhiteColor,
                      //     builder: (context){
                      //       return Column(
                      //         children: [
                      //           CustomHeadingText(
                      //             text: 'Priority',
                      //             textSize: 25,
                      //           ),
                      //
                      //           SizedBox(height: 10,),
                      //           _divider(),
                      //
                      //           _listTile('Priority', 'Low'),
                      //           _divider(),
                      //
                      //           _listTile('Priority', 'Normal'),
                      //           _divider(),
                      //
                      //           _listTile('Priority', 'High'),
                      //         ],
                      //       );
                      //     }
                      //   );
                      // }
                    },
                    child:
                    TaskSection(
                      icon: Icons.flag,
                      title: 'Priority',
                      detail: priority,
                      iconColor: (priority == 'High') ? kRedColor
                        : kYellowColor
                    ),
                  ),

                  SizedBox(height: Get.height * 0.01,),
                  Row(
                    children: [
                      Expanded(child: Divider(
                        color: kLightGreyColor2,
                        thickness: 1,
                      ))
                    ],
                  ),

                  SizedBox(height: Get.height * 0.01,),
                  GestureDetector(
                    onTap: (){
                      // if(isEditable) {
                      //   showModalBottomSheet(
                      //     context: context,
                      //     showDragHandle: true,
                      //     backgroundColor: kWhiteColor,
                      //     builder: (context){
                      //       return SizedBox(
                      //         height: Get.height * 0.3,
                      //         child: Column(
                      //           children: [
                      //             CustomHeadingText(
                      //               text: 'Assignee',
                      //               textSize: 25,
                      //             ),
                      //
                      //             SizedBox(height: 10,),
                      //             _divider(),
                      //
                      //             SizedBox(height: 10,),
                      //             CustomDropDownMenu(
                      //               width: Get.width * 0.9,
                      //               items: [
                      //                 DropdownMenuEntry(value: 'Bilawal Mehmood', label: 'Bilawal Mehmood'),
                      //                 DropdownMenuEntry(value: 'Ismail Memon', label: 'Ismail Memon'),
                      //               ],
                      //               hintText: 'Select',
                      //               onSelected: (value) => controller.selectedAssignee.value = value!,
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     }
                      //   );
                      // }
                    },
                    child: TaskSection(
                      icon: Icons.person,
                      title: 'Assignee',
                      detail: assignee,
                      iconColor: kGreyColor
                    ),
                  ),

                  SizedBox(height: Get.height * 0.01,),
                  Row(
                    children: [
                      Expanded(child: Divider(
                        color: kLightGreyColor2,
                        thickness: 1,
                      ))
                    ],
                  ),

                  SizedBox(height: Get.height * 0.01,),
                  GestureDetector(
                    onTap: (){
                      // if(isEditable){
                      //   calendarController.showCalendar(
                      //     onPressed: (){
                      //       String formattedDate = DateFormat('d-M-yyyy').format(calendarController.theSelectedDay.value);
                      //       controller.selectedDate.value = formattedDate;
                      //     }
                      //   );
                      // }
                    },
                    child: TaskSection(
                      icon: Icons.calendar_month_rounded,
                      title: 'Due Date',
                      detail: dueDate,
                      iconColor: kGreyColor
                    ),
                  ),
                ],
              );
            }
            ),

            SizedBox(height: 30,),
            Text(
              'Description',
              style: TextStyle(
                color: kGreyColor,
                fontSize: 15
              ),
            ),

            SizedBox(
              height: Get.height * 0.09,
              child: Text(
                'description',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Edit Task',
                        buttonColor: kPrimaryColor,
                        textColor: kWhiteColor,
                        onPressed: (){
                          // controller.onEditPressed();
                        }
                      )
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Save Changes',
                        buttonColor: kLightGreyColor2,
                        textColor: kPrimaryColor,
                        onPressed: (){
                          // showDialog(
                          //   context: context,
                          //   builder: (context){
                          //     return AlertDialog(
                          //       backgroundColor: kWhiteColor,
                          //       title: CustomHeadingText(
                          //         text: 'Confirm Changes?',
                          //         textSize: 20,
                          //       ),
                          //       actions: [
                          //         TextButton(
                          //           onPressed: (){
                          //             Get.back();
                          //           },
                          //           child: CustomHeadingText(
                          //             text: 'No',
                          //             textSize: 14,
                          //             textColor: kPrimaryColor,
                          //           ),
                          //         ),
                          //
                          //         TextButton(
                          //           onPressed: (){
                          //             controller.editTask(id);
                          //             controller.isEditable.value = false;
                          //             Get.offAllNamed(kDashboardScreenRoute);
                          //           },
                          //           child: CustomHeadingText(
                          //             text: 'Yes',
                          //             textSize: 14,
                          //             textColor: kPrimaryColor,
                          //           ),
                          //         )
                          //       ],
                          //       actionsPadding: EdgeInsets.only(right: 10),
                          //     );
                          //   }
                          // );
                        },
                      )
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _divider(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: Divider(
            color: kLightGreyColor2,
            thickness: 1,
          ))
        ],
      ),
    );
  }

  Widget _listTile(String title, String subTitle){
    return Obx((){
      final bool isSelected = (title == 'Status')
        ? controller.selectedStatus.value == subTitle
        : controller.selectedPriority.value == subTitle;

      return ListTile(
        leading: (title == 'Status') ? Icon(
          Icons.radio_button_checked,
          color: (subTitle == 'Pending') ? kYellowColor
            : (subTitle == 'In Progress') ? kGreenColor
            : kPrimaryColor,
        ) : Icon(
          Icons.flag,
          color: (subTitle == 'Low') ? kYellowColor
            : (subTitle == 'Normal') ? kGreenColor
            : kRedColor,
        ),
        title: LabelText(
          text: subTitle,
          fontWeight: FontWeight.w600,
          textSize: 17,
        ),
        trailing: Icon(
          Icons.check,
          color: isSelected ? kPrimaryColor : Colors.transparent,
        ),
        horizontalTitleGap: 10,
        onTap: (){
          controller.onSelected(title, subTitle);
        },
        selected: isSelected,
      );
    });
  }
}