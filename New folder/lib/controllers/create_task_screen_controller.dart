import 'package:get/get.dart';
import 'package:taska_app/database/services/add_task_service.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/task_details_model.dart';
import 'package:taska_app/screens/screens_colors.dart';

class TaskScreenController extends GetxController{

  final AddTaskService _service = AddTaskService();
  var allTasks = <TaskDetailsModel>[].obs;

  RxString title = ''.obs;
  RxString dueDate = ''.obs;
  RxString priority = ''.obs;
  RxString status = ''.obs;
  RxString assignee = ''.obs;
  RxString description = ''.obs;

  @override
  void onInit(){
    super.onInit();
    fetchTasks();
  }

  void submitTask(){
    final newTask = TaskDetailsModel(
      title: title.value,
      dueDate: dueDate.value,
      priority: priority.value,
      status: status.value,
      assignee: assignee.value,
      description: description.value,
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
      await fetchTasks();
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

  Future<void> deleteTasks() async {
    try{
      await _service.deleteAllTasks();
      await fetchTasks();
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
}