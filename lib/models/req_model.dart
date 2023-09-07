import 'package:gsg_final_project_rgs/view_features/auth/model/user.dart';

class RegModel {
  String? _message;
  User? _user;
  String? _token;

  RegModel({String? message, User? user, String? token}) {
    if (message != null) {
      this._message = message;
    }
    if (user != null) {
      this._user = user;
    }
    if (token != null) {
      this._token = token;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  User? get user => _user;
  set user(User? user) => _user = user;
  String? get token => _token;
  set token(String? token) => _token = token;

  RegModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    data['token'] = this._token;
    return data;
  }
}
