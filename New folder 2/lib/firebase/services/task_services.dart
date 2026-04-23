import 'package:taska_app/firebase/firebase_client.dart';

import '../../model/task_details_model.dart';

class TaskServices {
  final FirebaseClient _client = FirebaseClient();

  static final TaskServices _instance = TaskServices._private();
  TaskServices._private();

  factory TaskServices() => _instance;

  Future<String> addTask(TaskDetailsModel task) async {

    try{
      final result = await _client.addRequest(
          collectionName: 'tasks',
          customId: task.id.toString(),
          data: task.toJson(task)
      );

      if(result.containsKey('error')){
        return 'Some error occurred';
      }
      else{
        return 'Task added Successfully';
      }

    } catch(e){
      return 'Some error occurred, please try again later..';
    }
  }

  Future<String> deleteTask(String taskId) async{
    try{
      final result = await _client.deleteRequest(collectionName: 'tasks', docId: taskId);
      if(result == 'Success'){
        return 'Task deleted Successfully';
      }
      else{
        return 'Some error Occurred';
      }
    } catch(e){
      return e.toString();
    }
  }

  Future<String> updateTask(String taskId, TaskDetailsModel task) async{
    try{
      final result = await _client.updateRequest(collectionName: 'tasks', docId: taskId, data: task.toJson(task));
      if(result == 'Success'){
        return 'Task Updated Successfully';
      }
      else{
        return 'Some error occurred';
      }
    } catch(e){
      return e.toString();
    }
  }

  Future<List<TaskDetailsModel>> getAllTasks() async{
    try{
      final result = await _client.getAllRequest(collectionName: 'tasks');

      if(result is Map && result.containsKey('error')){
        throw Exception('Some error Occurred..');
      }
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(result);
      final List<TaskDetailsModel> allTasks = [];

      for(var task in data){
        allTasks.add(TaskDetailsModel.fromJson(task));
      }
      return allTasks;
    } catch(e){
      throw Exception(e.toString());
    }
  }
}