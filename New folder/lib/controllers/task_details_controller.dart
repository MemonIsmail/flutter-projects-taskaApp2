import 'package:get/get.dart';
import 'package:taska_app/controllers/create_task_screen_controller.dart';
import 'package:taska_app/database/services/add_task_service.dart';

class TaskDetailsController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isEditable.value = false;
  }

  final TaskScreenController taskScreenController = Get.put(TaskScreenController());

  final AddTaskService _service = AddTaskService();

  RxString selectedStatus = ''.obs;
  RxString selectedPriority = ''.obs;
  RxString selectedAssignee = ''.obs;

  RxBool isEditable = false.obs;

  void onSelected(String title, String subTitle){
    if(title == 'Status'){
      selectedStatus.value = subTitle;
    }
    else{
      selectedPriority.value = subTitle;
    }
  }

  Future<void> editTask(String title) async{
    try{
      await _service.updateTask(title, selectedStatus.value, selectedPriority.value, selectedAssignee.value);
      await taskScreenController.fetchTasks();
      Get.snackbar('Success', 'Updated Tasks');
    } catch(e){
      Get.snackbar('Error', 'Some Error occurred');
    }
  }

  void onEditPressed(){
    isEditable.value = true;
    Get.snackbar('You can now Edit the Task as you want', '');
  }
}