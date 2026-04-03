import 'package:floor/floor.dart';

@entity
class UserEntity {
  @primaryKey
  final String? userName;

  final String? password;
  final String? role;
  final String? email;

  UserEntity({this.userName, this.email, this.role, this.password});
}