// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $TaskaDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $TaskaDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $TaskaDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<TaskaDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorTaskaDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TaskaDatabaseBuilderContract databaseBuilder(String name) =>
      _$TaskaDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TaskaDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$TaskaDatabaseBuilder(null);
}

class _$TaskaDatabaseBuilder implements $TaskaDatabaseBuilderContract {
  _$TaskaDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $TaskaDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $TaskaDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<TaskaDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TaskaDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TaskaDatabase extends TaskaDatabase {
  _$TaskaDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  TaskDao? _taskDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserEntity` (`id` INTEGER NOT NULL, `email` TEXT NOT NULL, `userName` TEXT NOT NULL, `password` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TaskEntity` (`id` INTEGER, `title` TEXT NOT NULL, `dueDate` TEXT NOT NULL, `priority` TEXT NOT NULL, `status` TEXT NOT NULL, `assignee` TEXT NOT NULL, `userId` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userEntityInsertionAdapter = InsertionAdapter(
            database,
            'UserEntity',
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'userName': item.userName,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserEntity> _userEntityInsertionAdapter;

  @override
  Future<UserEntity?> findUserByName(
    String email,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM UserEntity WHERE email = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => UserEntity(
            id: row['id'] as int,
            userName: row['userName'] as String,
            email: row['email'] as String,
            password: row['password'] as String),
        arguments: [email, password]);
  }

  @override
  Future<void> deleteAllUsers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM UserEntity');
  }

  @override
  Future<void> insertUser(UserEntity user) async {
    await _userEntityInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskEntityInsertionAdapter = InsertionAdapter(
            database,
            'TaskEntity',
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'dueDate': item.dueDate,
                  'priority': item.priority,
                  'status': item.status,
                  'assignee': item.assignee,
                  'userId': item.userId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskEntity> _taskEntityInsertionAdapter;

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    return _queryAdapter.queryList('Select * FROM TaskEntity',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            dueDate: row['dueDate'] as String,
            priority: row['priority'] as String,
            status: row['status'] as String,
            assignee: row['assignee'] as String,
            userId: row['userId'] as int));
  }

  @override
  Future<List<TaskEntity>> getTaskByEmail(String email) async {
    return _queryAdapter.queryList('SELECT * FROM TaskEntity WHERE email = ?1',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            dueDate: row['dueDate'] as String,
            priority: row['priority'] as String,
            status: row['status'] as String,
            assignee: row['assignee'] as String,
            userId: row['userId'] as int),
        arguments: [email]);
  }

  @override
  Future<List<TaskEntity>> getTaskByEmailAndStatus(
    String email,
    String status,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM TaskEntity WHERE email = ?1 AND status = ?2',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            dueDate: row['dueDate'] as String,
            priority: row['priority'] as String,
            status: row['status'] as String,
            assignee: row['assignee'] as String,
            userId: row['userId'] as int),
        arguments: [email, status]);
  }

  @override
  Future<void> deleteAllTasks() async {
    await _queryAdapter.queryNoReturn('DELETE FROM TaskEntity');
  }

  @override
  Future<void> updateTask(
    int id,
    String status,
    String priority,
    String assignee,
    String dueDate,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE TaskEntity SET status = ?2, priority = ?3, assignee = ?4, dueDate = ?5 WHERE id = ?1',
        arguments: [id, status, priority, assignee, dueDate]);
  }

  @override
  Future<void> deleteTask(
    int id,
    String email,
  ) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM TaskEntity WHERE id = ?1 AND email = ?2',
        arguments: [id, email]);
  }

  @override
  Future<List<TaskEntity>> getTaskBySearch(
    String email,
    String query,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM TaskEntity WHERE email = ?1 AND title LIKE ?2',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            dueDate: row['dueDate'] as String,
            priority: row['priority'] as String,
            status: row['status'] as String,
            assignee: row['assignee'] as String,
            userId: row['userId'] as int),
        arguments: [email, query]);
  }

  @override
  Future<int> addTask(TaskEntity task) {
    return _taskEntityInsertionAdapter.insertAndReturnId(
        task, OnConflictStrategy.abort);
  }
}
