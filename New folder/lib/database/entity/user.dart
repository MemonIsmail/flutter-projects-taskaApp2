import 'package:floor/floor.dart';

@entity
class UserEntity {
  @primaryKey
  final String? email;

  final String? userName;
  final String? password;
  final String? role;

  UserEntity({
    this.userName,
    this.email,
    this.role,
    this.password
  });
}