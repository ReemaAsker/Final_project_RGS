import '../../../cores/helpers/shared_pref.dart';

Future<bool?> checkInSharedPref() async {
  final SharedPreferencesController prefs = SharedPreferencesController();
  bool? userIsFound = await prefs.checkKeyContain('user');
  return userIsFound;
}
