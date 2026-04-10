import 'package:get/get.dart';
import 'package:taska_app/controllers/login_screen_controller.dart';
import 'package:taska_app/database/services/add_task_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/task_details_model.dart';
import 'package:taska_app/screens/screens_colors.dart';

class TaskScreenController extends GetxController{

  final LoginScreenController loginScreenController = Get.put(LoginScreenController(), permanent: true);

  RxString isSelected = 'All'.obs;

  final AddTaskService _service = AddTaskService();

  var allTasks = <TaskDetailsModel>[].obs;

  RxString title = ''.obs;
  RxString dueDate = ''.obs;
  RxString priority = ''.obs;
  RxString status = ''.obs;
  RxString description = ''.obs;

  @override
  void onInit(){
    super.onInit();
    fetchTasksByEmail();
  }

  void submitTask(){
    final newTask = TaskDetailsModel(
      title: title.value,
      dueDate: dueDate.value,
      priority: priority.value,
      status: status.value,
      assignee: loginScreenController.name.value,
      description: description.value,
      email: loginScreenController.email.value,
    );
    createTask(newTask);
  }

  Future<void> createTask(TaskDetailsModel newTask) async{
    try{
      await _service.addTask(newTask);
      Get.snackbar(
        'Success', 'Task Added Successfully',
        backgroundColor: kWhiteColor,
      );
      await fetchTasksByEmail();
      Get.offNamed(kDashboardScreenRoute);
    }
    catch(e){
      Get.snackbar(
        'Error', '$e',
        backgroundColor: kWhiteColor,
      );
    }
  }

  Future<void> fetchTasks() async {
    try{
      var tasks = await _service.getAllTasks();
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

  Future<void> fetchTasksByEmail() async {
    try{
      var tasks = await _service.getTasksByEmail(loginScreenController.email.value);
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
    try{
      var tasks = await _service.getTasksByEmailAndStatus(loginScreenController.email.value, isSelected.value);
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

  Future<void> deleteAllTasks() async {
    try{
      await _service.deleteAllTasks();
      await fetchTasksByEmail();
      Get.snackbar(
        'Success', 'Deleted all the Tasks',
        backgroundColor: kWhiteColor,
      );
    } catch(e){
      Get.snackbar(
        'Error', 'An error occured',
        backgroundColor: kWhiteColor,
      );
    }
  }

  Future<void> deleteTask(int index) async {
    print('Deleting....');
    int? id = allTasks[index].id;
    print('id: $id');
    String email = allTasks[index].email;
    await _service.deleteTask(id!, email);
    allTasks.removeAt(index);
  }

  void onStatusSelected(String title){
    isSelected.value = title;
  }
}