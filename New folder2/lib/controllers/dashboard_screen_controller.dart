import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/database/services/add_task_service.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/constants.dart';

import '../model/task_details_model.dart';
import '../screens/screens_colors.dart';

class DashboardScreenController extends GetxController{

  @override
  void onInit() {
    fetchTasksById();
    ever(searchQuery, (_) => fetchTasksBySearch(searchQuery.value));
    super.onInit();
  }

  final _service = AddTaskService();
  final _userService = UserLoginService();

  RxString isSelected = ''.obs;
  RxBool isLoading = false.obs;
  String userName = '';
  String formattedDate = DateFormat('d-M-yyyy').format(DateTime.now());
  RxString searchQuery = ''.obs;

  var allTasks = <TaskDetailsModel>[].obs;
  var allSearchTasks = <TaskDetailsModel>[].obs;

  Future<void> onCreateTaskPressed() async{
    // Get.toNamed(kCreateTaskRoute);
    try{
      await _service.addAllTask(allTasks);
      Get.snackbar('Success', 'Added all the Tasks');
    } catch(e) {
      Get.snackbar('Error', '$e');
    }
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
        'assignee': userName,
        'dueDate': formattedDate,
      }
    );
  }

  void logout() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(kLoginScreenRoute);
  }

  void fetchTasksBySearch(String query) {
    allSearchTasks.assignAll(
      allTasks.where((task) => task.title.toLowerCase().contains(query.toLowerCase()))
    );
  }


  Future<void> fetchTasksById() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id') ?? 0;
    userName = prefs.getString('userName') ?? '';

    try{
      isLoading(true);

      var tasks = await _userService.getTasks(id);
      if(tasks != null){
        allTasks.assignAll(tasks);
        allSearchTasks.assignAll(tasks);
      }
    } catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    } finally{
      isLoading(false);
    }
  }

  void fetchTaskByStatus() {
    allSearchTasks.assignAll(
      allTasks.where((task) => task.status == isSelected.value),
    );
  }

  Future<void> deleteTask(int index) async {
    // int? id = allTasks[index].id;
    // await _service.deleteTask(id!);
    allTasks.removeAt(index);
  }

  void onStatusSelected(String title){
    isSelected.value = title;
  }
}