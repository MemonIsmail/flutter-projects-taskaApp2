import 'package:floor/floor.dart';

import '../entity/user.dart';

@dao
abstract class UserDao{
  @Query('SELECT * FROM User WHERE userName = :userName AND password = :password')
  Future<UserEntity?> findUserByName(String userName, String password);

  @insert
  Future<void> insertUser(UserEntity user);
}