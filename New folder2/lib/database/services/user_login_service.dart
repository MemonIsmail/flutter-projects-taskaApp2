import 'package:taska_app/database/http_client.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/model/task_details_model.dart';

import '../../model/user_model.dart';
import '../app_db_client.dart';
import '../entity/user.dart';

class UserLoginService {
  static final UserLoginService _instance =
  UserLoginService._private();

  UserLoginService._private();

  factory UserLoginService(){
    return _instance;
  }
  Future<UserModel?> getUserByName(String email, String password) async {
    final database = await AppDBClient().initializeDB();
    UserEntity? user = await database.userDao.findUserByName(email, password);
    if(user != null) {
      return UserModel.fromUserEntity(user);
    }
    else{
      return null;
    }
  }

  Future<void> addUser(UserModel userModel) async {
    final database = await AppDBClient().initializeDB();
    final UserEntity user = userModel.userToEntity();
    await database.userDao.insertUser(user);
  }

  Future<void> deleteUsers() async {
    final database = await AppDBClient().initializeDB();
    await database.userDao.deleteAllUsers();
  }

  Future<UserModel> loginUser(String userName, String password) async {
    UserModel userModel = UserModel();
    Map<String, String> body = {'username': userName, 'password': password};
    Map<String, dynamic> response = await HTTPClient().postRequest(
      url: kLoginURL,
      requestBody: body,
    );

    if(response.isNotEmpty && response['data'] != null){
      userModel = UserModel.fromJson(response['data']);
    }

    return userModel;
  }

  Future<List<TaskDetailsModel>> getTasks(int id) async {
    List<TaskDetailsModel> allTasks = [];
    Map<String, dynamic> response = await HTTPClient().getRequest(url: kGetTasksURL);
    if(response.isNotEmpty && response['data'] != null){
      for(var t in response['data']['todos']  ?? []){
        TaskDetailsModel task = TaskDetailsModel.fromJson(t);
        if(task.userId == id){
          allTasks.add(task);
        }
      }
    }
    return allTasks;
  }
}