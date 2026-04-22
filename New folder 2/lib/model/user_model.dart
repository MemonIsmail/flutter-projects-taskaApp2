import '../database/entity/user.dart';

class UserModel {
  final int id;
  final String userName;
  final String email;
  final String password;

  UserModel({
    this.id = 0,
    this.userName = '',
    this.email = '',
    this.password = '',
  });

  UserEntity userToEntity(){
    return UserEntity(
      id: id,
      userName: userName,
      email: email,
      password: password,
    );
  }

   factory UserModel.fromUserEntity(UserEntity user){
    return UserModel(
      id: user.id,
      userName: user.userName,
      email: user.email,
      password: user.password,
    );
   }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'] ?? 0,
      userName: json['firstName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson(UserModel user){
    return{
      'userName': user.userName,
      'email': user.email,
      'password': user.password,
    };
  }
}