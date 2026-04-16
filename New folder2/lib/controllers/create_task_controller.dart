import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/database/services/add_task_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/task_details_model.dart';
import 'package:taska_app/screens/screens_colors.dart';

class CreateTaskController extends GetxController{

  final AddTaskService _service = AddTaskService();

  RxString dueDate = ''.obs;
  bool priority = false;
  bool status = false;

  // Future<void> createTask(String title, String description) async{
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   String userName = prefs.getString('userName') ?? '';
  //
  //   final newTask = TaskDetailsModel(
  //     title: title,
  //     dueDate: dueDate.value,
  //     priority: priority,
  //     status: status,
  //     assignee: userName,
  //   );
  //   try{
  //     // String? error = validate(title, priority, status, description);
  //
  //     if(error == null){
  //       await _service.addTask(newTask);
  //       Get.snackbar(
  //         'Success', 'Task Added Successfully',
  //         backgroundColor: kWhiteColor,
  //       );
  //       Get.offAllNamed(kDashboardScreenRoute);
  //     }
  //     else{
  //       Get.snackbar('Error', error);
  //     }
  //   }
  //   catch(e){
  //     Get.snackbar(
  //       'Error', '$e',
  //       backgroundColor: kWhiteColor,
  //     );
  //   }
  // }

  String? validate(String title, String priority, String status, String description){
    if(title.isEmpty || priority.isEmpty || status.isEmpty || description.isEmpty){
      return 'Some details are missing!!';
    }
    return null;
  }
}