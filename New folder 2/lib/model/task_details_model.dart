import '../database/entity/task.dart';

class TaskDetailsModel{
  final int? id;
  final String title;
  final String dueDate;
  final String assignee;
  final String priority;
  final String status;
  final int userId;

  TaskDetailsModel({
    this.id,
    this.title = '',
    this.dueDate = '',
    this.assignee = '',
    this.priority = '',
    this.status = '',
    this.userId = 0,
  });


  TaskEntity taskToEntity(){
    return TaskEntity(
      title: title,
      dueDate: dueDate,
      priority: priority,
      status: status,
      assignee: assignee,
    );
  }

  factory TaskDetailsModel.fromTaskEntity(TaskEntity task){
    return TaskDetailsModel(
      id: task.id,
      title: task.title,
      dueDate: task.dueDate,
      priority: task.priority,
      status: task.status,
      assignee: task.assignee,
    );
  }

  factory TaskDetailsModel.fromJson(Map<String, dynamic> json){
    return TaskDetailsModel(
      id: json['id'] ?? -1,
      title: json['todo'] ?? '',
      priority: json['completed'] ? 'Low' : 'High',
      status: json['completed'] ? 'Completed' : 'In Progress',
      userId: json['userId'] ?? 0,
    );
  }
}