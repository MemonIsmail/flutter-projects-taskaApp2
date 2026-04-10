import 'package:get/get.dart';
import 'package:taska_app/controllers/create_task_screen_controller.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/screens/task_details_screen.dart';

class DashboardScreenController extends GetxController{
  TaskScreenController taskScreenController = Get.put(TaskScreenController(), permanent: true);

  void onLogOutPressed(){
    Get.offAllNamed(kLoginScreenRoute);
  }

  void onCreateTaskPressed(){
    Get.toNamed(kTaskScreenRoute);
  }

  void onTaskPressed(int index){
    final task = taskScreenController.allTasks[index];
    Get.to(TaskDetailsScreen
      (
        id: task.id,
        title: task.title,
        status: task.status,
        priority: task.priority,
        assignee: task.assignee,
        dueDate: task.dueDate,
        description: task.description,
    ));
  }
}