import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/controllers/dashboard_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets/custom_button.dart';
import 'package:taska_app/screens/widgets/custom_heading_text.dart';
import 'package:taska_app/screens/widgets/custom_text_field.dart';
import 'package:taska_app/screens/widgets/label_text.dart';
import 'package:taska_app/screens/widgets/task_details.dart';

class DashboardScreen extends GetView<DashboardScreenController>{
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Get.height * 0.215,
          backgroundColor: kPrimaryColor,

          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Image.asset(
              'assets/AppLogo.png',
              height: 60,
              width: 60,
            ),
          ),

          title: CustomHeadingText(
            text: 'Taska',
            textColor: kWhiteColor,
            textSize: 30
          ),
          titleSpacing: 8,

          actionsPadding: EdgeInsets.only(right: 10),
          actions: [
            TextButton(
              onPressed: (){
                controller.logout();
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 17,
                ),
              ),
            )
          ],

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.06),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: SizedBox(
                height: Get.height * 0.080,
                child: CustomTextField(
                  hintText: 'Search for Tasks',
                  prefIcon: Icons.search,
                  suffIcon: Icons.tune_rounded,
                  onChanged: (value) => controller.searchQuery.value = value,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: kWhiteColor,
                      showDragHandle: true,
                      builder: (context){
                        return SizedBox(
                          height: Get.height * 0.45,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: CustomHeadingText(
                                    text: 'Filters',
                                    textSize: 25,
                                  ),
                                ),

                                SizedBox(height: 10,),
                                _divider(),

                                SizedBox(height: 15,),
                                LabelText(
                                  text: 'Status',
                                  textSize: 20,
                                ),

                                SizedBox(height: 20,),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    spacing: Get.width * 0.03,
                                    children: [
                                      _status('All'),
                                      _status('In Progress'),
                                      _status('Pending'),
                                      _status('Completed'),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 20,),
                                _divider(),

                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        text: 'Reset',
                                        buttonColor: kLightGreyColor2,
                                        textColor: kPrimaryColor,
                                        onPressed: (){
                                          Get.back();
                                          controller.fetchTasksBySearch(controller.searchQuery.value);
                                          controller.isSelected.value = 'All';
                                          FocusScope.of(context).unfocus();
                                        }
                                      ),
                                    ),

                                    SizedBox(width: Get.width * 0.03,),
                                    Expanded(
                                      child: CustomButton(
                                        text: 'Apply',
                                        buttonColor: kPrimaryColor,
                                        textColor: kWhiteColor,
                                        onPressed: (){
                                          Get.back();
                                          FocusScope.of(context).unfocus();
                                          if(controller.isSelected.value == 'All'){
                                            controller.fetchTasksBySearch(controller.searchQuery.value);
                                          }
                                          else{
                                            controller.fetchTaskByStatus();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  },
                  suffixIconColor: kPrimaryColor,
                  showIcon: true,
                ),
              ),
            ),
          )
        ),

        backgroundColor: kLightGreyColor,
        body: Stack(
          children: [
            Obx(() {
              if(controller.allSearchTasks.isEmpty){
                return RefreshIndicator(
                  onRefresh: () async{
                    await controller.fetchTasksById();
                  },
                  color: kPrimaryColor,
                  backgroundColor: kWhiteColor,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.25,),
                        controller.isLoading.value
                        ? Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                            strokeWidth: 4,
                          ),
                        )
                        : Center(
                            child: Text(
                              'No Tasks Found...',
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 16
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                );
              }
              else{
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CustomHeadingText(
                          text: 'All Tasks',
                          textColor: kBlackColor,
                          textSize: 20
                        ),

                        SizedBox(height: Get.height * 0.022,),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.allSearchTasks.length,
                          itemBuilder: (context, index) {
                            final task = controller.allSearchTasks[index];
                            return Column(
                              children: [

                                Dismissible(
                                  key: Key(task.id.toString()),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    padding: EdgeInsets.only(right: 20),
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:kLightGreyColor3,
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kLightRedColor,
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.delete_outline_rounded,
                                        color: kRedColor,
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    controller.deleteTask(index);
                                  },
                                  confirmDismiss: (direction) async{
                                    return await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: kWhiteColor,
                                        title: CustomHeadingText(text: 'Are you Sure, you want to delete?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Get.back(result: false);
                                            },
                                            child: CustomHeadingText(
                                              text: 'No',
                                              textColor: kPrimaryColor,
                                            )
                                          ),

                                          TextButton(
                                            onPressed: () {
                                              Get.back(result: true);
                                            },
                                            child: CustomHeadingText(
                                              text: 'Yes',
                                              textColor: kPrimaryColor,
                                            )
                                          ),
                                        ],
                                      )
                                    );
                                  },
                                  child: GestureDetector(
                                    onTap: () => controller.onTaskPressed(index),
                                    child: TaskDetails(
                                      id: task.id,
                                      title: task.title,
                                      dueDate: controller.formattedDate,
                                      priority: task.priority,
                                      status: task.status,
                                      assignee: controller.userName,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.02,)
                              ],
                            );
                          }
                        ),
                        SizedBox(height: Get.height * 0.05,),
                      ],
                    ),
                  ),
                );
              }
            }
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                      child: ElevatedButton(
                        onPressed: (){
                          controller.onCreateTaskPressed();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          foregroundColor: kWhiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_box_rounded,
                              color: kWhiteColor,
                            ),
                            SizedBox(width: Get.width * 0.02,),
                            Text('Create New Task'),
                          ],
                        ),
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _status(String title){
    return GestureDetector(
      onTap: () => controller.onStatusSelected(title),
      child: Obx((){
        final bool isSelected = controller.isSelected.value == title;
        return Container(
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : kWhiteColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: isSelected ? Colors.transparent : kGreyColor,
              width: 1,
            )
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? kWhiteColor : kLightGreyColor4,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }),
    );
  }

  Widget _divider(){
    return Row(
      children: [
        Expanded(child: Divider(
          color: kLightGreyColor2,
          thickness: 1,
        ))
      ],
    );
  }
}