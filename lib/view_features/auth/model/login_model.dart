import 'dart:convert';

import 'package:gsg_final_project_rgs/models/user.dart';

class LoginModel {
  User? _user;
  String? _token;

  LoginModel({User? user, String? token}) {
    if (user != null) {
      this._user = user;
    }
    if (token != null) {
      this._token = token;
    }
  }

  User? get user => _user;
  set user(User? user) => _user = user;
  String? get token => _token;
  set token(String? token) => _token = token;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _user = User.fromJson(json['user']);
    _token = json['token'];
  }

  String toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    data['token'] = _token;
    return json.encode(data);
  }
}
