import '../database/entity/user.dart';

class UserModel {
  String? userName;
  String? email;
  String? role;
  String? password;
  UserModel({
    this.userName,
    this.email,
    this.role,
    this.password,
  });

  UserEntity userToEntity(){
    return UserEntity(
      userName: userName,
      email: email,
      role: role,
      password: password,
    );
  }

  UserModel.fromUserEntity(UserEntity user){
    userName = user.userName;
    email = user.email;
    role = user.role;
    password = user.password;
  }
}