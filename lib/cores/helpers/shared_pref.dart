import 'package:gsg_final_project_rgs/view_features/auth/model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  SharedPreferences? _prefs;

  static final SharedPreferencesController _instance =
      SharedPreferencesController._internal();
  factory SharedPreferencesController() {
    return _instance;
  }

  Future<void> _checkInstance() async {
    if (_prefs == null) {
      await init();
    }
  }

  SharedPreferencesController._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> setToken(String key, LoginModel userInfo) async {
    await _checkInstance();
    return await _prefs?.setString(key, loginModelToJson(userInfo));
  }

  Future<bool?> checkKeyContain(String key) async {
    await _checkInstance();
    return _prefs?.containsKey(key);
  }

  dynamic getData(String key) {
    _checkInstance();
    return _prefs?.get(key);
  }

  Future<bool?> logout(String key) async {
    await _checkInstance();
    bool? isremoved = await _prefs?.remove(key);
    if (isremoved == null) return true;
    return await _prefs?.remove(key);
  }
  
}
