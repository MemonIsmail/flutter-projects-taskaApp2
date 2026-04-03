import 'package:taska_app/database/database.dart';

class AppDBClient {
  static final AppDBClient _instance = AppDBClient._private();

  AppDBClient._private();

  factory AppDBClient()=>_instance;

  TaskaDatabase? _database;

  final String _databaseName = 'TaskaDB';

  Future<TaskaDatabase> initializeDB() async{
    _database ??= await $FloorTaskaDatabase.databaseBuilder(_databaseName).build();
    return _database!;
  }
}