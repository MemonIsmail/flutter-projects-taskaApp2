class TaskDetailsModel{
  final String id;
  final String title;
  final String dueDate;
  final String assignee;
  final String priority;
  final String status;
  final String userId;
  final String description;

  TaskDetailsModel({
    this.id = '',
    this.title = '',
    this.dueDate = '',
    this.assignee = '',
    this.priority = '',
    this.status = '',
    this.userId = '',
    this.description = '',
  });


  // TaskEntity taskToEntity(){
  //   return TaskEntity(
  //     id: id,
  //     title: title,
  //     dueDate: dueDate,
  //     priority: priority,
  //     status: status,
  //     assignee: assignee,
  //     userId: userId,
  //   );
  // }

  // factory TaskDetailsModel.fromTaskEntity(TaskEntity task){
  //   return TaskDetailsModel(
  //     id: task.id,
  //     title: task.title,
  //     dueDate: task.dueDate,
  //     priority: task.priority,
  //     status: task.status,
  //     assignee: task.assignee,
  //     userId: task.userId,
  //   );
  // }

  factory TaskDetailsModel.fromJson(Map<String, dynamic> json){
    return TaskDetailsModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      priority: json['priority'] ?? '',
      status: json['status'] ?? '',
      assignee: json['assignee'] ?? '',
      userId: json['userId'] ?? '',
      dueDate: json['dueDate'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson(TaskDetailsModel task){
    return{
      'id': task.id,
      'title': task.title,
      'priority': task.priority,
      'status': task.status,
      'assignee': task.assignee,
      'userId': task.userId,
      'dueDate': task.dueDate,
      'description': task.description,
    };
  }
}