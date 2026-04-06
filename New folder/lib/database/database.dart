import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:taska_app/database/dao/task_dao.dart';

import 'dao/user_dao.dart';
import 'entity/task.dart';
import 'entity/user.dart';


part 'database.g.dart';

@Database(version: 1, entities: [UserEntity, TaskEntity])
abstract class TaskaDatabase extends FloorDatabase{
  UserDao get userDao;
  TaskDao get taskDao;
}