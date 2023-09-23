import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/view_features/Profile/profile_repository.dart';

import '../../cores/helpers/shared_pref.dart';
import '../auth/model/auth_model.dart';
import '../auth/model/user.dart';

class ProfileProvider extends ChangeNotifier {
  late ProfileRepo _profileRepo;
  late ApiResponse<String> _profilePicturePath;
  late ApiResponse<User> _user;

  ProfileProvider() {
    _profileRepo = ProfileRepo();
  }

  uploadImage(File file, mailId) async {
    _profilePicturePath = ApiResponse.loading("fetching image path");
    notifyListeners();
    try {
      _profileRepo.uploadImage(file, mailId);
      _profilePicturePath = ApiResponse.completed(file.path);
    } catch (e) {
      _profilePicturePath = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  getUserData() async {
    _user = ApiResponse.loading("fetching user data");
    notifyListeners();
    try {
      User myUser = await _profileRepo.getUserData();
      _user = ApiResponse.completed(myUser);
    } catch (e) {
      _user = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  Future<bool?> updateUserInSharedpref(User? user, String token) async {
    return await SharedPreferencesController().setToken(
        "user", LoginModel(token: _profileRepo.userToken!, user: user));
  }
}
