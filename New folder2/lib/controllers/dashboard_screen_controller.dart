import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/database/services/add_task_service.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';

import '../model/task_details_model.dart';
import '../screens/screens_colors.dart';

class DashboardScreenController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    fetchTasksById();
  }

  final _service = AddTaskService();
  final _userService = UserLoginService();

  RxString isSelected = ''.obs;

  var allTasks = <TaskDetailsModel>[].obs;

  void onCreateTaskPressed(){
    Get.toNamed(kCreateTaskRoute);
  }

  void onTaskPressed(int index){
    final task = allTasks[index];
    Get.toNamed(
      kTaskDetailsRoute,
      arguments: {
        'id': task.id,
        'title': task.title,
        'status': task.status,
        'priority': task.priority,
        'assignee': task.assignee,
        'dueDate': task.dueDate,
      }
    );
  }

  void logout() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(kLoginScreenRoute);
  }

  Future<void> fetchTasksBySearch(String query) async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    try{
      var tasks = await _service.getTasksBySearch(email, query);
      if(tasks != null){
        allTasks.assignAll(tasks);
      }
    } catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    }
  }

  Future<void> fetchTasksById() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id') ?? 0;
    try{
      var tasks = await _userService.getTasks(id);
      if(tasks != null){
        allTasks.assignAll(tasks);
      }
    } catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    }
  }

  Future<void> fetchTasksByEmailAndStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    try{
      var tasks = await _service.getTasksByEmailAndStatus(email, isSelected.value);
      if(tasks != null){
        allTasks.assignAll(tasks);
      }
    } catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    }
  }

  // Future<void> deleteTask(int index) async {
  //   int? id = allTasks[index].id;
  //   await _service.deleteTask(id!);
  //   allTasks.removeAt(index);
  // }

  void onStatusSelected(String title){
    isSelected.value = title;
  }
}