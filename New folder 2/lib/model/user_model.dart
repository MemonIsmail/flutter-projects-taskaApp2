import '../database/entity/user.dart';

class UserModel {
  final String id;
  final String userName;
  final String email;
  final String password;

  UserModel({
    this.id = '',
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
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
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