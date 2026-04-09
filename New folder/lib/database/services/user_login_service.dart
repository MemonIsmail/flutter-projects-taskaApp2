
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
}