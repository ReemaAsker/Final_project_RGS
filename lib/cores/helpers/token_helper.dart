import 'package:gsg_final_project_rgs/cores/helpers/shared_pref.dart';
import 'package:gsg_final_project_rgs/view_features/auth/model/auth_model.dart';

String? getToken() {
  final user = SharedPreferencesController().getData('user');
  LoginModel current_user;
  if (user != null && user is String) {
    current_user = userFromJson(user);
    return current_user.token;
  } else {
    return "User not found";
  }
}

bool removeUser() {
  bool removeUser_done = true;
  try {
    SharedPreferencesController()
        .logout('user')
        .then((value) => removeUser_done = value!);
  } catch (e) {
    print(e);
  }
  return removeUser_done;
}
