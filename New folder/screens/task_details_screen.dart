import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/task_details_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class TaskDetailsScreen extends GetView<TaskDetailsController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: CustomHeadingText(text: 'Task Details', textColor: kBlackColor, textSize: 20),
      ),
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeadingText(text: 'Create a Mobile App for Taska', textColor: kIndigoAccent, textSize: 25),
            SizedBox(height: 20,),
            TaskSection(icon: Icons.circle, title: 'Status', detail: 'In progress', iconColor: kGreenColor1),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ))
              ],
            ),
            SizedBox(height: 5,),
            TaskSection(icon: Icons.flag, title: 'Priority', detail: 'High', iconColor: Color(0xFFd6042d)),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ))
              ],
            ),
            SizedBox(height: 5,),
            TaskSection(icon: Icons.person, title: 'Assignee', detail: 'Abdul Kareem', iconColor: kGreyColor),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ))
              ],
            ),
            SizedBox(height: 5,),
            TaskSection(icon: Icons.calendar_month_rounded, title: 'Due Date', detail: '10 March 2023', iconColor: kGreyColor),
            SizedBox(height: 15,),
            Text(
              'Description',
              style: TextStyle(
                color: kGreyColor,
                fontSize: 15
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Design all the UIs of this App, like Splash Screen, Login Screen, Signup Screen, Dashboard Screen, etc',
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Edit Task',
                    buttonColor: kIndigoAccent,
                    textColor: kWhiteColor,
                    onPressed: (){}
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}