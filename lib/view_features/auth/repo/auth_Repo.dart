import 'package:gsg_final_project_rgs/cores/utils/constants.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../model/login_model.dart';
import '../../../cores/helpers/shared_pref.dart';

class AuthRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final SharedPreferencesController pref = SharedPreferencesController();

  Future<LoginModel> login(Map<String, String> body) async {
    final response = await _helper.post(loginUrl, true, null, body);

    return LoginModel.fromJson(response);
  }

  Future<bool?> setUserInSharedpref(LoginModel user) async {
    return await pref.setToken("user", user);
  }
}
