import 'package:taska_app/database/app_db_client.dart';
import 'package:taska_app/database/database.dart';
import 'package:taska_app/database/entity/task.dart';
import 'package:taska_app/model/task_details_model.dart';

class AddTaskService {

  static final AddTaskService _instance = AddTaskService._private();

  AddTaskService._private();

  factory AddTaskService(){
    return _instance;
  }

  Future<void> addAllTask(List<TaskDetailsModel> tasks) async {
    final database = await AppDBClient().initializeDB();
    for(var task in tasks){
      await database.taskDao.addTask(task.taskToEntity());
    }
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
          TaskDetailsModel(
            id: v.id,
            title: v.title,
            dueDate: v.dueDate,
            status: v.status,
            priority: v.priority,
            assignee: v.assignee,
            userId: v.userId
          )
        );
      }
    }
    return allTasksList;
  }

  Future<List<TaskDetailsModel>?> getTasksByEmail(String email) async{
    final TaskaDatabase database = await AppDBClient().initializeDB();
    List<TaskDetailsModel> allTasksList = [];
    List<TaskEntity> entities = await database.taskDao.getTaskByEmail(email);
    if(entities.isNotEmpty){
      for(var v in entities){
        allTasksList.add(
          TaskDetailsModel(
            id: v.id,
            title: v.title,
            dueDate: v.dueDate,
            status: v.status,
            priority: v.priority,
            assignee: v.assignee,
          )
        );
      }
    }
    return allTasksList;
  }

  Future<List<TaskDetailsModel>?> getTasksByEmailAndStatus(String email, String status) async{
    final TaskaDatabase database = await AppDBClient().initializeDB();
    List<TaskDetailsModel> allTasksList = [];
    List<TaskEntity> entities = await database.taskDao.getTaskByEmailAndStatus(email, status);
    if(entities.isNotEmpty){
      for(var v in entities){
        allTasksList.add(
          TaskDetailsModel(
            title: v.title,
            dueDate: v.dueDate,
            status: v.status,
            priority: v.priority,
            assignee: v.assignee,
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

  Future<void> deleteTask(int id, String email) async {
    final database = await AppDBClient().initializeDB();
    await database.taskDao.deleteTask(id, email);
  }

  Future<List<TaskDetailsModel>?> getTasksBySearch(String email, String query) async{
    final TaskaDatabase database = await AppDBClient().initializeDB();
    List<TaskDetailsModel> allTasksList = [];
    List<TaskEntity> entities = await database.taskDao.getTaskBySearch(email, '%$query%');
    if(entities.isNotEmpty){
      for(var v in entities){
        allTasksList.add(
          TaskDetailsModel(
            id: v.id,
            title: v.title,
            dueDate: v.dueDate,
            status: v.status,
            priority: v.priority,
            assignee: v.assignee,
          )
        );
      }
    }
    return allTasksList;
  }
}