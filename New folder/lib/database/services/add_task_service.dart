import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:taska_app/controllers/task_screen_controller.dart';
import 'package:taska_app/database/app_db_client.dart';
import 'package:taska_app/database/database.dart';
import 'package:taska_app/database/entity/task.dart';
import 'package:taska_app/database/services/user_login_service.dart';
import 'package:taska_app/model/task_details_model.dart';

class AddTaskService {

  static final AddTaskService _instance =
  AddTaskService._private();

  AddTaskService._private();

  factory AddTaskService(){
    return _instance;
  }

  Future<void> addTask(TaskDetailsModel taskModel) async {
    final database = await AppDBClient().initializeDB();
    final TaskEntity task = taskModel.taskToEntity();
    await database.taskDao.addTask(task);
  }

  Future<List<TaskDetailsModel>?> getAllTasks() async{
    final TaskaDatabase database = await AppDBClient().initializeDB();
    List<TaskDetailsModel> allTasksList = [];
    List<TaskEntity> entities = await database.taskDao.getAllTasks();
    if(entities.isNotEmpty){
      for(var v in entities){
        allTasksList.add(
          TaskDetailsModel(
            title: v.title,
            dueDate: '',
            status: v.status,
            priority: v.priority,
            assignee: v.assignee,
            description: v.description,
          )
        );
      }
    }
    return allTasksList;
  }

  Future<void> deleteAllTasks() async {
    final database = await AppDBClient().initializeDB();
    await database.taskDao.deleteAllTasks();
  }
}