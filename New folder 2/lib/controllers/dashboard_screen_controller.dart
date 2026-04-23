import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/database/services/local/local_task_services.dart';
import 'package:taska_app/database/services/web/web_task_services.dart';
import 'package:taska_app/routing/routes.dart';

import '../model/task_details_model.dart';
import '../screens/screens_colors.dart';

class DashboardScreenController extends GetxController{

  @override
  void onInit() {
    loadUserName();
    _initTasks();
    ever(searchQuery, (_) => fetchTasksBySearch(searchQuery.value));
    super.onInit();
  }

  final _localTaskServices = LocalTaskServices();
  final _webTaskServices = WebTaskServices();

  RxString isSelected = ''.obs;
  RxBool isLoading = false.obs;
  String userName = '';
  String formattedDate = DateFormat('d-M-yyyy').format(DateTime.now());
  RxString searchQuery = ''.obs;

  var allTasks = <TaskDetailsModel>[].obs;
  var allSearchTasks = <TaskDetailsModel>[].obs;

  void loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName') ?? '';
  }

  Future<void> _initTasks() async {
    await getAllTasks();
    await fetchTasksById();
  }

  Future<void> onCreateTaskPressed() async{
    Get.toNamed(kCreateTaskRoute);
  }

  void onTaskPressed(int index){
    final task = allTasks[index];
    Get.toNamed(
      kTaskDetailsRoute,
      arguments: task
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
    final int? id = prefs.getInt('id');
    userName = prefs.getString('userName') ?? '';
    if(id == null) {
      // Get.snackbar('Error', 'Please Log in again..');
      return;
    }
    try{
      final tasks = await _localTaskServices.getAllTasksById(id);
      if(tasks != null){
        allTasks.assignAll(tasks);
        allSearchTasks.assignAll(tasks);
      }
    } catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    }
  }

  void fetchTaskByStatus() {
    allSearchTasks.assignAll(
      allTasks.where((task) => task.status == isSelected.value),
    );
  }

  Future<void> deleteTask(int index) async {
    int? id = allTasks[index].id;
    await _localTaskServices.deleteTask(id!);
    allTasks.removeAt(index);
    fetchTasksById();
  }

  Future<void> deleteAllTask() async {
    await _localTaskServices.deleteAllTasks();
  }

  void onStatusSelected(String title){
    isSelected.value = title;
  }

  Future<void> getAllTasks() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id') ?? 0;
    try{
      var tasks = await _webTaskServices.getTasks(id);
      await _localTaskServices.addAllTask(tasks);
    } catch(e) {}
  }

  Future<void> onRefresh() async {
    await _initTasks();
  }
}