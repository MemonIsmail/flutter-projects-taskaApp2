import 'package:taska_app/database/database.dart';

class AppDBClient {

  AppDBClient._internal();

  static final AppDBClient _instance = AppDBClient._internal();

  factory AppDBClient()=>_instance;

  TaskaDatabase? _database;

  final String _databaseName = 'TaskaDB';

  Future<TaskaDatabase> initializeDB() async{
    _database ??= await $FloorTaskaDatabase.databaseBuilder(_databaseName).build();
    return _database!;
  }
}