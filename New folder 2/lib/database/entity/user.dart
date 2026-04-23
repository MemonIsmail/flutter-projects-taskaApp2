import 'package:floor/floor.dart';

@entity
class UserEntity {
  @primaryKey
  final int id;

  final String email;
  final String userName;
  final String password;

  UserEntity({
    this.id = 0,
    this.userName = '',
    this.email = '',
    this.password = '',
  });
}