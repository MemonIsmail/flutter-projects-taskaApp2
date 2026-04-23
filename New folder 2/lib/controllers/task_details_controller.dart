import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taska_app/firebase/services/user_services.dart';
import 'package:taska_app/model/task_details_model.dart';

class TaskDetailsController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    isEditable.value = false;
  }

  var allTasks = <TaskDetailsModel>[].obs;

  final UserServices _firebaseServices = UserServices();

  RxString title = ''.obs;
  RxString selectedStatus = ''.obs;
  RxString selectedPriority = ''.obs;
  RxString selectedAssignee = ''.obs;
  RxString selectedDate = ''.obs;
  RxString description = ''.obs;
  RxString userId = ''.obs;

  RxBool isEditable = false.obs;
  RxString userName = ''.obs;

  int? id;
  String formattedDate = DateFormat('d-MM-yyyy').format(DateTime.now());

  void onSelected(String title, String subTitle){
    if(title == 'Status'){
      selectedStatus.value = subTitle;
    }
    else{
      selectedPriority.value = subTitle;
    }
  }

  Future<void> editTask(String id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId.value = prefs.getString('userId') ?? '';
    userName.value = prefs.getString('userName') ?? '';
    try{
      final TaskDetailsModel updatedTask = TaskDetailsModel(
        id: id,
        title: title.value,
        status: selectedStatus.value,
        priority: selectedPriority.value,
        assignee: userName.value,
        dueDate: selectedDate.value,
        description: description.value,
        userId: userId.value,
      );
      await _firebaseServices.updateTask(id, updatedTask);
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