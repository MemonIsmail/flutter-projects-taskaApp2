import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final String userName;

  final String password;
  final String role;
  final String email;

  Person(this.userName, this.email, this.role, this.password);
}