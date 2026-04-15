import 'package:floor/floor.dart';

import '../entity/user.dart';

@dao
abstract class UserDao{
  @Query('SELECT * FROM UserEntity WHERE email = :email AND password = :password')
  Future<UserEntity?> findUserByName(String email, String password);

  @insert
  Future<void> insertUser(UserEntity user);

  @Query('DELETE FROM UserEntity')
  Future<void> deleteAllUsers();
}