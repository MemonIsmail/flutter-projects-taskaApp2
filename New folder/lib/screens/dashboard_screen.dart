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
          SingleChildScrollView(
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
                  Obx(() => Column(
                    children: [
                      if(taskScreenController.allTasks.isEmpty)
                        const Text('No Tasks Found...')
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: taskScreenController.allTasks.length,
                          itemBuilder: (context, index) {
                            final task = taskScreenController.allTasks[index];
                            return GestureDetector(
                              onTap: () => controller.onTaskPressed(index),
                              child: TaskDetails(
                                title: task.title,
                                dueDate: task.dueDate,
                                priority: task.priority,
                                status: task.status,
                                assignee: task.assignee,
                                description: task.description
                              ),
                            );
                          }
                        ),
                      SizedBox(height: 30,),
                    ],
                  )
                  )
                ],
              ),
            ),
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
}