import '../database/entity/task.dart';

class TaskDetailsModel{
  String? title;
  String? dueDate;
  String? priority;
  String? status;
  String? assignee;
  String? description;

  TaskDetailsModel({
    this.title,
    this.dueDate,
    this.priority,
    this.status,
    this.assignee,
    this.description,
  });


  TaskEntity taskToEntity(){
    return TaskEntity(
      title: title,
      // dueDate: dueDate,
      priority: priority,
      status: status,
      assignee: assignee,
      description: description,
    );
  }

  factory TaskDetailsModel.fromTaskEntity(TaskEntity task){
    return TaskDetailsModel(
      title: task.title,
      dueDate: '',
      priority: task.priority,
      status: task.status,
      assignee: task.assignee,
      description: task.description,
    );
  }
}