import 'package:floor/floor.dart';
import 'package:taska_app/database/entity/task.dart';

@dao
abstract class TaskDao {

  @Query('Select * FROM TaskEntity')
  Future<List<TaskEntity>> getAllTasks();

  @insert
  Future<void> addTask(TaskEntity task);

  @Query('DELETE FROM TaskEntity')
  Future<void> deleteAllTasks();
  
  @Query('UPDATE TaskEntity SET status = :status, priority = :priority, assignee = :assignee WHERE title = :title')
  Future<void> updateTask(String title, String status, String priority, String assignee);
}