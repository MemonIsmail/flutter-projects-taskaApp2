import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/firebase/services/user_services.dart';
import 'package:taska_app/routing/routes.dart';

import '../model/task_details_model.dart';
import '../screens/screens_colors.dart';

class DashboardScreenController extends GetxController{

  @override
  void onInit() {
    loadUserName();
    fetchTasksById();
    ever(searchQuery, (_) => fetchTasksBySearch(searchQuery.value));
    super.onInit();
  }

  final _firebaseServices = UserServices();

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
    final String id = prefs.getString('userId') ?? '';
    try{
      isLoading.value = true;
      final tasks = await _firebaseServices.getAllTasks();
      for(var task in tasks){
        if(task.userId == id){
          allTasks.add(task);
          allSearchTasks.add(task);
        }
      }
    } catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    } finally{
      isLoading.value = false;
    }
  }

  void fetchTaskByStatus() {
    allSearchTasks.assignAll(
      allTasks.where((task) => task.status == isSelected.value),
    );
  }

  Future<void> deleteTask(int index) async {
    String? id = allTasks.removeAt(index).id;
    await _firebaseServices.deleteTask(id);
    Get.offAllNamed(kDashboardScreenRoute);
  }

  void onStatusSelected(String title){
    isSelected.value = title;
  }

}