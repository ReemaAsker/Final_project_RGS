import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/cores/helpers/token_helper.dart';
import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/models/sender.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../cores/helpers/api_base_helper.dart';

class CreateMailRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  late ApiResponse<Map<String, dynamic>> _userdata;

  Future<ApiResponse<Map<String, dynamic>>> create_mail(
      MailClass new_mail) async {
    Map<String, dynamic> response = {};
    // Response responsee;
    _userdata = ApiResponse.loading("fetch created ..");
    try {
      response = await _helper.post(mailsUrl, new_mail.toJson(), httpHeader());
      print("*******************");
      print(response);
      _userdata = ApiResponse.completed(response);
      // responsee = await http.post(Uri.parse(baseUrl + mailsUrl),
      //     body: new_mail.toJson(), headers: httpHeader());
      // print(responsee.body);
      // print("from json ........");
      // print(MailClass.fromJson(response["mail"]).subject);
      // print("....... ........");
    } catch (e) {
      _userdata = ApiResponse.error("mail isn't created ,try again");
    }
    print("################");
    print(response);
    return _userdata;
  }

  Future<ApiResponse<Map<String, dynamic>>> create_sender(
      Sender new_sender) async {
    Map<String, dynamic> response = {};
    _userdata = ApiResponse.loading("fetch created ..");
    try {
      response =
          await _helper.post(senderUrl, new_sender.toJson(), httpHeader());
      print(response);
      _userdata = ApiResponse.completed(response);
    } catch (e) {
      _userdata = ApiResponse.error("Can't created sender, try again");
    }
    return _userdata;
  }

  // Future<Tag> create_Tag(Tag new_tag) async {
  //   Response response;
  //   _userdata = ApiResponse.loading("fetch created ..");
  //   try {
  //     response = await http.post(Uri.parse(baseUrl + tagUrl),
  //         body: new_tag.toJson(),
  //         headers: httpHeader());
  //     print(response.body);
  //     // _userdata = ApiResponse.completed(response);

  //     // print("from json ........");
  //     // print(MailClass.fromJson(response["mail"]).subject);
  //     // print("....... ........");
  //   } catch (e) {
  //     print("Tag error created ::::::::: $e");
  //   }
  //   return Tag.fromJson(new_tag.toJson());
  // }
///////////////////
// Future<ApiResponse<Map<String, dynamic>>> uploadAttachment(
//       MailClass new_mail) async {
//     Map<String, dynamic> response;
//     // _userdata = ApiResponse.loading("fetch created ..");
//     try {
//       response = await _helper.post(mailsUrl, new_mail.toJson(), httpHeader());
//       print(response);
//       _userdata = ApiResponse.completed(response);
//       // print("from json ........");
//       // print(MailClass.fromJson(response["mail"]).subject);
//       // print("....... ........");
//     } catch (e) {
//       _userdata = ApiResponse.error("error ..");
//     }
//     return _userdata;
//   }
///////////////////////

  // Future<String> signup(Map<String, dynamic> body) async {
  //   final response = await _helper.post(registerUrl, true, null, body);
  //   return userToJson(LoginModel.fromJson(response));
  // }
}
/*
// await http.
    // post(Uri.parse(baseUrl + mailsUrl,),
    //     body: mail_data,
    //     headers: {
    //       'Authorization': 'Bearer ${getToken()!.token}',
    //       'Accept': 'application/json'
    //     });

*/