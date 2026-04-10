import 'package:floor/floor.dart';

@entity
class TaskEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;


  final String title;
  final String dueDate;
  final String priority;
  final String status;
  final String assignee;
  final String description;
  final String email;

  TaskEntity({
    this.id,
    this.title = '',
    this.dueDate = '',
    this.priority = '',
    this.status = '',
    this.assignee = '',
    this.description = '',
    this.email = '',
  });
}