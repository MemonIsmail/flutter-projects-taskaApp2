import '../database/entity/user.dart';

class UserModel {
  final String userName;
  final String email;
  final String role;
  final String password;

  UserModel({
    this.userName = '',
    this.email = '',
    this.role = '',
    this.password = '',
  });

  UserEntity userToEntity(){
    return UserEntity(
      userName: userName,
      email: email,
      role: role,
      password: password,
    );
  }

   factory UserModel.fromUserEntity(UserEntity user){
    return UserModel(
      userName: user.userName,
      email: user.email,
      role: user.role,
      password: user.password,
    );
   }
}