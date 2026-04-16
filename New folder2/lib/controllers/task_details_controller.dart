import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/database/services/add_task_service.dart';
import 'package:taska_app/model/task_details_model.dart';

import '../screens/screens_colors.dart';

class TaskDetailsController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    isEditable.value = false;
  }

  var allTasks = <TaskDetailsModel>[].obs;

  final AddTaskService _service = AddTaskService();

  RxString selectedStatus = ''.obs;
  RxString selectedPriority = ''.obs;
  RxString selectedAssignee = ''.obs;
  RxString selectedDate = ''.obs;

  RxBool isEditable = false.obs;

  void onSelected(String title, String subTitle){
    if(title == 'Status'){
      selectedStatus.value = subTitle;
    }
    else{
      selectedPriority.value = subTitle;
    }
  }

  Future<void> editTask(int id) async{
    try{
      await _service.updateTask(id, selectedStatus.value, selectedPriority.value, selectedAssignee.value, selectedDate.value);
      await fetchTasksByEmail();
      Get.snackbar('Success', 'Updated Tasks');
    } catch(e){
      Get.snackbar('Error', 'Some Error occurred');
    }
  }

  void onEditPressed(){
    isEditable.value = true;
    Get.snackbar('You can now Edit the Task as you want', '');
  }

  Future<void> fetchTasksByEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    try{
      var tasks = await _service.getTasksByEmail(email);
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
}