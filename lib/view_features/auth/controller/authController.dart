import '../../../cores/helpers/api_response.dart';
import '../../../cores/helpers/shared_pref.dart';
import '../model/login_model.dart';
import '../repo/auth_Repo.dart';

class AuthController {
  late ApiResponse<LoginModel> _userdata;
  late AuthRepository _authsRepo = AuthRepository();
  static String getToken() {
    final user = SharedPreferencesController().getData('user');
    if (user != null && user is String) {
      return user;
    } else {
      return "User not found";
    }
  }

  static bool removeUser() {
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

  Future<ApiResponse<LoginModel>> login(Map<String, String> body) async {
    _userdata = ApiResponse.loading('Loding..');
    try {
      var response = await _authsRepo.login(body);

      _authsRepo.setUserInSharedpref(response);
      _userdata = ApiResponse.completed(response);
      print(_userdata);
    } catch (e) {
      _userdata = ApiResponse.error(e.toString());
    }
    return _userdata;
  }
}
