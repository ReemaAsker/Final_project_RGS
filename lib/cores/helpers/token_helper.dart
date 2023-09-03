import 'package:gsg_final_project_rgs/cores/helpers/shared_pref.dart';

Future<String> getToken() async {
  return await SharedPreferencesController().getData('token');
}
