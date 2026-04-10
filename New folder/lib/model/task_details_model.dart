import '../database/entity/task.dart';

class TaskDetailsModel{
  final int? id;
  final String title;
  final String dueDate;
  final String priority;
  final String status;
  final String assignee;
  final String description;
  final String email;

  TaskDetailsModel({
    this.id,
    this.title = '',
    this.dueDate = '',
    this.priority = '',
    this.status = '',
    this.assignee = '',
    this.description = '',
    this.email = '',
  });


  TaskEntity taskToEntity(){
    return TaskEntity(
      title: title,
      dueDate: dueDate,
      priority: priority,
      status: status,
      assignee: assignee,
      description: description,
      email: email,
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
      description: task.description,
      email: task.email,
    );
  }
}