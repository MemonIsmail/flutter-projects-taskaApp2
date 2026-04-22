import 'package:taska_app/database/services/local/app_db_client.dart';
import 'package:taska_app/database/database.dart';
import 'package:taska_app/database/entity/task.dart';
import 'package:taska_app/model/task_details_model.dart';

class LocalTaskServices {

  static final LocalTaskServices _instance = LocalTaskServices._private();

  LocalTaskServices._private();

  factory LocalTaskServices(){
    return _instance;
  }

  Future<void> addAllTask(List<TaskDetailsModel> tasks) async {
    final database = await AppDBClient().initializeDB();
    for(var task in tasks){
      await database.taskDao.addTask(task.taskToEntity());
    }
  }

  Future<void> addTask(TaskDetailsModel task) async {
    final database = await AppDBClient().initializeDB();
    await database.taskDao.addTask(task.taskToEntity());
  }

  Future<void> updateTask(int id, String status, String priority, String assignee, String dueDate) async {
    final database = await AppDBClient().initializeDB();
    await database.taskDao.updateTask(id, status, priority, assignee, dueDate);
  }

  Future<List<TaskDetailsModel>?> getAllTasks() async{
    final TaskaDatabase database = await AppDBClient().initializeDB();
    List<TaskDetailsModel> allTasksList = [];
    List<TaskEntity> entities = await database.taskDao.getAllTasks();
    if(entities.isNotEmpty){
      for(var v in entities){
        allTasksList.add(
          TaskDetailsModel.fromTaskEntity(v)
        );
      }
    }
    return allTasksList;
  }

  Future<List<TaskDetailsModel>?> getAllTasksById(int id) async{
    final TaskaDatabase database = await AppDBClient().initializeDB();
    List<TaskDetailsModel> allTasksList = [];
    List<TaskEntity> entities = await database.taskDao.getTaskById(id);
    if(entities.isNotEmpty){
      for(var v in entities){
        allTasksList.add(
          TaskDetailsModel.fromTaskEntity(v)
        );
      }
    }
    return allTasksList;
  }

  Future<void> deleteAllTasks() async {
    final database = await AppDBClient().initializeDB();
    await database.taskDao.deleteAllTasks();
  }

  Future<void> deleteTask(int id) async {
    final database = await AppDBClient().initializeDB();
    await database.taskDao.deleteTask(id);
  }

}