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

  Future<bool?> setToken(String key, String token) async {
    await _checkInstance();
    return await _prefs?.setString('token', token);
  }
  // Future<bool?> setData(String key, dynamic data) async {
  //   await _checkInstance();
  //   switch (data.runtimeType) {
  //     case int:
  //       return _prefs?.setInt(key, data);
  //     case String:
  //       return _prefs?.setString(key, data);
  //     case bool:
  //       return _prefs?.setBool(key, data);
  //   }
  // return null;
  // }

  dynamic getData(String key) async {
    await _checkInstance();
    return _prefs?.get(key);
  }
}
