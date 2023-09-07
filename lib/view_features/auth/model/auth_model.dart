import 'dart:convert';
import 'package:gsg_final_project_rgs/view_features/auth/model/user.dart';

LoginModel userFromJson(String str) => LoginModel.fromJson(json.decode(str));

String userToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}
