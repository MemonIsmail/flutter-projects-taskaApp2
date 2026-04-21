import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/database/services/local/local_task_services.dart';
import 'package:taska_app/model/task_details_model.dart';

import '../screens/screens_colors.dart';

class TaskDetailsController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    isEditable.value = false;
    fetchTasksById();
  }

  var allTasks = <TaskDetailsModel>[].obs;

  final LocalTaskServices _service = LocalTaskServices();

  RxString selectedStatus = ''.obs;
  RxString selectedPriority = ''.obs;
  RxString selectedAssignee = ''.obs;
  RxString selectedDate = ''.obs;

  RxBool isEditable = false.obs;

  int? id;
  RxString userName = ''.obs;
  String formattedDate = DateFormat('d-MM-yyyy').format(DateTime.now());

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
      await fetchTasksById();
      Get.snackbar('Success', 'Updated Tasks');
    } catch(e){
      Get.snackbar('Error', 'Some Error occurred');
    }
  }

  void onEditPressed(){
    isEditable.value = true;
    Get.snackbar('You can now Edit the Task as you want', '');
  }

  Future<void> fetchTasksById() async {
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getInt('id') ?? 0;
    userName.value = prefs.getString('userName') ?? '';
    try{
      var tasks = await _service.getAllTasksById(id!);
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