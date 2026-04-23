import 'package:floor/floor.dart';

@entity
class UserEntity {
  @primaryKey
  final String id;

  final String email;
  final String userName;
  final String password;

  UserEntity({
    this.id = '',
    this.userName = '',
    this.email = '',
    this.password = '',
  });
}