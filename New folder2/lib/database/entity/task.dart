import 'package:floor/floor.dart';

@entity
class TaskEntity {
  @primaryKey
  final int? id;


  final String title;
  final String dueDate;
  final bool priority;
  final bool status;
  final String assignee;
  final int userId;

  TaskEntity({
    this.id,
    this.title = '',
    this.dueDate = '',
    this.priority = false,
    this.status = false,
    this.assignee = '',
    this.userId = 0,
  });
}