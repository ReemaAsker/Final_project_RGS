import 'package:gsg_final_project_rgs/cores/helpers/token_helper.dart';
import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';

import '../../../cores/helpers/api_base_helper.dart';

class CreateMailRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Mail> create_mail(MailClass new_mail) async {
    final response = null;
    try {
      print("***************toJson*************");
      Map<String, dynamic> mailMap = new_mail.toJson();
      print(mailMap);
      final response = await _helper
          .post(mailsUrl, mailMap, {'Authorization': 'Bearer ${getToken()}'});
    } catch (e) {
      print("erorrrrrrrrrrrrrrrrr");
      print(e);
    }
    // print("******************************");
    // print(response);
    // print(Mail.fromJson(response));

    print("******************************");

    return Mail.fromJson(response);
  }

  // Future<String> signup(Map<String, dynamic> body) async {
  //   final response = await _helper.post(registerUrl, true, null, body);
  //   return userToJson(LoginModel.fromJson(response));
  // }
}
