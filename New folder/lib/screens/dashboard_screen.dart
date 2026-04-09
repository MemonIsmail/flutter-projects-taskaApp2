import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/create_task_screen_controller.dart';
import 'package:taska_app/controllers/dashboard_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class DashboardScreen extends GetView<DashboardScreenController>{
  final TaskScreenController taskScreenController = Get.put(TaskScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
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
              controller.onLogOutPressed();
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
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: SizedBox(
              height: 55,
              child: CustomTextField(
                hintText: 'Search for Tasks',
                prefIcon: Icons.search,
                suffIcon: Icons.tune_rounded,
                onPressed: (){
                  // showModalBottomSheet(
                  //   context: context,
                  //   backgroundColor: kWhiteColor,
                  //   showDragHandle: true,
                  //   builder: (context){
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Center(
                  //             child: CustomHeadingText(
                  //               text: 'Filters',
                  //               textSize: 25,
                  //             ),
                  //           ),
                  //
                  //           SizedBox(height: 10,),
                  //           _divider(),
                  //
                  //           SizedBox(height: 10,),
                  //           LabelText(
                  //             text: 'Status',
                  //             textSize: 20,
                  //           ),
                  //           SizedBox(height: 10,),
                  //           SingleChildScrollView(
                  //             scrollDirection: Axis.horizontal,
                  //             child: Row(
                  //               children: [
                  //                 _status('All'),
                  //                 SizedBox(width: 10,),
                  //                 _status('In Progress'),
                  //                 SizedBox(width: 10,),
                  //                 _status('Pending'),
                  //                 SizedBox(width: 10,),
                  //                 _status('Completed'),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   }
                  // );
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
            if(taskScreenController.allTasks.isEmpty){
              return Column(
                children: [
                  SizedBox(height: 180,),
                  Center(
                    child: Text(
                      'No Tasks Found...',
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 16
                      ),
                    )
                  ),
                ],
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
                      SizedBox(height: 15,),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: taskScreenController.allTasks.length,
                          itemBuilder: (context, index) {
                            final task = taskScreenController.allTasks[index];
                            return Column(
                              children: [
                                Dismissible(
                                  key: Key(task.title),
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
                                    taskScreenController.deleteTask(index);
                                  },
                                  confirmDismiss: (direction) async{
                                    return await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
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
                                        title: task.title,
                                        dueDate: task.dueDate,
                                        priority: task.priority,
                                        status: task.status,
                                        assignee: task.assignee,
                                        description: task.description
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,)
                              ],
                            );
                          }
                      ),
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
                        // elevation: 0.0
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_box_rounded,
                            color: kWhiteColor,
                          ),
                          SizedBox(width: 8,),
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
    );
  }
  // Widget _status(String title){
  //   return GestureDetector(
  //     onTap: () => controller.onStatusSelected(),
  //     child: Obx((){
  //       final bool isSelected = controller.isSelected.value;
  //       return Container(
  //         decoration: BoxDecoration(
  //             color: isSelected ? kPrimaryColor : kWhiteColor,
  //             borderRadius: BorderRadius.circular(5),
  //             border: Border.all(
  //               color: isSelected ? Colors.transparent : kGreyColor,
  //               width: 1,
  //             )
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
  //         child: Text(
  //           title,
  //           style: TextStyle(
  //             color: isSelected ? kWhiteColor : kLightGreyColor4,
  //             fontSize: 14,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //       );
  //     }
  //     ),
  //   );
  // }
  // Widget _divider(){
  //   return Row(
  //     children: [
  //       Expanded(child: Divider(
  //         color: kLightGreyColor2,
  //         thickness: 1,
  //       ))
  //     ],
  //   );
  // }
}