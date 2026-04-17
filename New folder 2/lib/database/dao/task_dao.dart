import 'package:floor/floor.dart';
import 'package:taska_app/database/entity/task.dart';

@dao
abstract class TaskDao {

  @Query('Select * FROM TaskEntity')
  Future<List<TaskEntity>> getAllTasks();

  @Query('SELECT * FROM TaskEntity WHERE email = :email')
  Future<List<TaskEntity>> getTaskByEmail(String email);

  @Query('SELECT * FROM TaskEntity WHERE email = :email AND status = :status')
  Future<List<TaskEntity>> getTaskByEmailAndStatus(String email, String status);

  @insert
  Future<int> addTask(TaskEntity task);

  @Query('DELETE FROM TaskEntity')
  Future<void> deleteAllTasks();
  
  @Query('UPDATE TaskEntity SET status = :status, priority = :priority, assignee = :assignee, dueDate = :dueDate WHERE id = :id')
  Future<void> updateTask(int id, String status, String priority, String assignee, String dueDate);

  @Query('DELETE FROM TaskEntity WHERE id = :id AND email = :email')
  Future<void> deleteTask(int id, String email);
  
  @Query('SELECT * FROM TaskEntity WHERE email = :email AND title LIKE :query')
  Future<List<TaskEntity>> getTaskBySearch(String email, String query);
}