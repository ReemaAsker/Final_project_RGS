import '../../../cores/helpers/api_response.dart';
import '../../../cores/helpers/shared_pref.dart';
import '../model/auth_model.dart';
import '../repo/auth_Repo.dart';

class AuthController {
  late ApiResponse<LoginModel> _userdata;
  late ApiResponse<Map<String, dynamic>> _userdatasign;
  final AuthRepository _authsRepo = AuthRepository();

  Future<bool?> setUserInSharedpref(LoginModel user) async {
    return await SharedPreferencesController().setToken("user", user);
  }

  Future<ApiResponse<LoginModel>> login(Map<String, String> body) async {
    _userdata = ApiResponse.loading('Loding..');
    try {
      var response = await _authsRepo.login(body);

      setUserInSharedpref(response);
      _userdata = ApiResponse.completed(response);
      print(_userdata);
    } catch (e) {
      _userdata = ApiResponse.error(e.toString());
    }
    return _userdata;
  }

  Future<ApiResponse<Map<String, dynamic>>> signup(
      Map<String, dynamic> body) async {
    _userdatasign = ApiResponse.loading('Loding..');
    try {
      var response = await _authsRepo.signup(body);

      _userdatasign = ApiResponse.completed(response);
    } catch (e) {
      _userdatasign = ApiResponse.error(e.toString());
    }
    return _userdatasign;
  }
}
