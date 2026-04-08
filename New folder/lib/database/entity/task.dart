import 'package:floor/floor.dart';

@entity
class TaskEntity {
  @primaryKey
  final String title;

  final String dueDate;
  final String priority;
  final String status;
  final String assignee;
  final String description;

  TaskEntity({
    this.title = '',
    this.dueDate = '',
    this.priority = '',
    this.status = '',
    this.assignee = '',
    this.description = '',
  });
}