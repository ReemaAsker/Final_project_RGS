import 'dart:io';

import 'package:http/http.dart' as http;

import '../../cores/helpers/api_base_helper.dart';
import '../../cores/helpers/token_helper.dart';
import '../../cores/utils/constants.dart';
import '../auth/model/user.dart';

class ProfileRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();
  String? userToken = getToken()!.token;

  Future<int> uploadImage(File file, mailId) async {
    var request = http.MultipartRequest("POST", Uri.parse(attachmentUrl));
//create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath('image', file.path);
    request.fields['mail_id'] = mailId.toString();
    request.fields['title'] = 'image_${DateTime.now()}';
//add multipart to request
    request.files.add(pic);
    request.headers.addAll(
        {'Accept': 'application/json', 'Authorization': 'Bearer $userToken'});
    var response = await request.send();

//Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    return response.statusCode;
  }

  Future<void> editUserName(String userName) async {
    String url = "/user/update";
    final response = await _helper.post(url, {
      'name': userName,
    }, {
      'Authorization': 'Bearer $userToken',
      'Accept': 'application/json'
    });
    print(response);
  }

  Future<User> getUserData() async {
    String url = "/user";
    final rsponse = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});
    User? user = User.fromJson(rsponse['user']);
    return User.fromJson(rsponse);
  }
}
