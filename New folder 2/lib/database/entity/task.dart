import 'package:floor/floor.dart';

@entity
class TaskEntity {
  @primaryKey
  final int? id;


  final String title;
  final String dueDate;
  final String priority;
  final String status;
  final String assignee;
  final int userId;

  TaskEntity({
    this.id,
    this.title = '',
    this.dueDate = '',
    this.priority = '',
    this.status = '',
    this.assignee = '',
    this.userId = 0,
  });
}