import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/dashboard_screen_controller.dart';
import 'package:taska_app/controllers/text_field_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class DashboardScreen extends GetView<DashboardScreenController>{
  @override
  Widget build(BuildContext context) {
    final TextFieldController textFieldController = TextFieldController();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: kIndigoAccent,
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
                  suffixIconColor: kIndigoAccent,
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

                  SizedBox(height: 5,),
                  TaskDetails(
                    title: 'Create a Mobile app for taska',
                    progress: 'In Progress',
                    priority: 'High',
                    assignee: 'Abdul Kareem',
                    date: '31 Feb 2026',
                  ),

                  SizedBox(height: 10,),
                  TaskDetails(
                    title: 'Create UI UX Design for taska Mobile App',
                    progress: 'Pending',
                    priority: 'Normal',
                    assignee: 'Muhammad Mubashir',
                    date: '31 Feb 2026',
                  ),

                  SizedBox(height: 10,),
                  TaskDetails(
                    title: 'Create Taska App in React Native',
                    progress: 'Completed',
                    priority: 'High',
                    assignee: 'Muhammad Mubashir',
                    date: '31 Feb 2026',
                  ),

                  SizedBox(height: 10,),
                  TaskDetails(
                    title: 'Create Taska App in React Native',
                    progress: 'Completed',
                    priority: 'High',
                    assignee: 'Muhammad Mubashir',
                    date: '31 Feb 2026',
                  ),

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
                          backgroundColor: kIndigoAccent,
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