class TaskDetailsModel{
  final String title;
  final String status;
  final String priority;
  final String assignee;
  final String dueDate;
  final String description;

  TaskDetailsModel({
    required this.title,
    required this.status,
    required this.priority,
    required this.assignee,
    required this.dueDate,
    required this.description,
  });
}