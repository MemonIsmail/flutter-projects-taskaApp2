import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/task_details_controller.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class TaskDetailsScreen extends GetView<TaskDetailsController>{
  final String title;
  final String status;
  final String priority;
  final String assignee;
  final String dueDate;
  final String description;
  const TaskDetailsScreen({
    super.key,
    this.title = '',
    this.status = '',
    this.priority = '',
    this.assignee = '',
    this.dueDate = '',
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            CustomHeadingText(
              text: title,
              textColor:
              kPrimaryColor,
              textSize: 23,
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: kWhiteColor,
                  builder: (context){
                    return Column(
                      children: [
                        CustomHeadingText(
                          text: 'Status',
                          textSize: 25,
                        ),

                        SizedBox(height: 10,),
                        _divider(),

                        _listTile('Status', 'Pending'),
                        _divider(),

                        _listTile('Status', 'In Progress'),
                        _divider(),

                        _listTile('Status', 'Completed'),
                      ],
                    );
                  }
                );
              },

              child:
                TaskSection(
                  icon: Icons.radio_button_checked,
                  title: 'Status', detail: status,
                  iconColor: (status == 'Completed') ? kPrimaryColor
                    : (status == 'In Progress') ? kGreenColor
                    : kYellowColor,
                ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Divider(
                  color: kLightGreyColor2,
                  thickness: 1,
                ))
              ],
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    backgroundColor: kWhiteColor,
                    builder: (context){
                      return Column(
                        children: [
                          CustomHeadingText(
                            text: 'Priority',
                            textSize: 25,
                          ),

                          SizedBox(height: 10,),
                          _divider(),

                          _listTile('Priority', 'Low'),
                          _divider(),

                          _listTile('Priority', 'Normal'),
                          _divider(),

                          _listTile('Priority', 'High'),
                        ],
                      );
                    }
                );
              },
              child:
              TaskSection(
                icon: Icons.flag,
                title: 'Priority',
                detail: priority,
                iconColor: (priority == 'High') ? kRedColor
                    : (priority == 'Normal') ? kGreenColor
                    : kYellowColor
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Divider(
                  color: kLightGreyColor2,
                  thickness: 1,
                ))
              ],
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: kWhiteColor,
                  builder: (context){
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomHeadingText(
                          text: 'Assignee',
                          textSize: 25,
                        ),
                        SizedBox(height: 10,),
                        _divider(),
                        SizedBox(height: 15,),
                        CustomDropDownMenu(
                          width: 280,
                          items: [
                            DropdownMenuEntry(value: 'Bilawal Mehmood', label: 'Bilawal Mehmood'),
                            DropdownMenuEntry(value: 'Ismail Memon', label: 'Ismail Memon'),
                          ],
                          hintText: 'Select',
                          icon: Icons.person,
                          showIcon: true,
                          onSelected: (value) => controller.selectedAssignee.value = value ?? '',
                        ),
                        SizedBox(height: 90,)
                      ],
                    );
                  }
                );
              },
              child:
              TaskSection(
                icon: Icons.person,
                title: 'Assignee',
                detail: assignee,
                iconColor: kGreyColor
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Divider(
                  color: kLightGreyColor2,
                  thickness: 1,
                ))
              ],
            ),
            SizedBox(height: 5,),
            TaskSection(icon: Icons.calendar_month_rounded, title: 'Due Date', detail: dueDate, iconColor: kGreyColor),
            SizedBox(height: 30,),
            Text(
              'Description',
              style: TextStyle(
                color: kGreyColor,
                fontSize: 15
              ),
            ),
            SizedBox(height: 5,),
            Text(
              description,
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 75,),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Edit Task',
                    buttonColor: kPrimaryColor,
                    textColor: kWhiteColor,
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            backgroundColor: kWhiteColor,
                            title: CustomHeadingText(
                              text: 'Confirm Changes?',
                              textSize: 20,
                            ),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Get.back();
                                },
                                child: CustomHeadingText(
                                  text: 'No',
                                  textSize: 14,
                                  textColor: kPrimaryColor,
                                ),
                              ),

                              TextButton(
                                onPressed: (){
                                  controller.editTask(title);
                                  Get.offAllNamed(kDashboardScreenRoute);
                                },
                                child: CustomHeadingText(
                                  text: 'Yes',
                                  textSize: 14,
                                  textColor: kPrimaryColor,
                                ),
                              )
                            ],
                            actionsPadding: EdgeInsets.only(right: 10),
                          );
                        }
                      );
                    }
                  )
                )
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
            Icons.circle,
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
      }
    );
  }
}