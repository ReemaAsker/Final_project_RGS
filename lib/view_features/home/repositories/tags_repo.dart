import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:gsg_final_project_rgs/models/pivot.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../../../cores/helpers/token_helper.dart';
import '../../../models/tag.dart';

class TagRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();
  late ApiResponse<Map<String, dynamic>> _userdata;

  String? userToken = getToken()!.token;
  // String userToken = "265|ksxcuVB3yjlAc44e76tblGvsoae68HxNiyjuIW7O";

  Future<List<Tag>> fetchAllTagsWithoutEmail() async {
    String url = tagUrl;
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});
    print("In fetchTagsWithoutMail//////////////////////////////////");
    List<Tag>? result = TagsResponseModel.fromJson(response).tags;
    print("000000000000000000000000");
    print(result!.length);
    // print(result![0].name);
    return result;
  }

  Future<List<Tag>?> fetchTagsWithEmail({required List<int> tags}) async {
    String url = tagUrl + '?tags=[';
    print(url);
    for (int i = 0; i < tags.length; i++) {
      url += tags[i].toString();
      if (i < tags.length - 1) {
        url += ","; // Add a semicolon if it's not the last element
      }
    }
    url += ']';

    // print(tagUrl);
    // print(url);
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});
    // print("In fetchTagsWithEmail//////////////////////////////////");
    // print(response);
    List<Tag>? result = TagsResponseModel.fromJson(response).tags;
    // print("000000000000000000000000");
    // print(result![0].id);
    return result;
  }

  Future<List<Tag>?> fetchTagsOfMail({required int mailId}) async {
    //  /mails/2/tags
    String url = mailsUrl + '/$mailId/tags';

    // print(url);
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});
    // print("In ffetchMailTags//////////////////////////////////");
    // print(response);
    List<Tag>? result = TagsResponseModel.fromJson(response).tags;
    // print("000000000000000000000000");
    // print(result);
    return result;
  }

  Future<Map<String, dynamic>> createTag({required String name}) async {
    Tag new_tag = Tag(
      name: name,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    Map<String, dynamic> response =
        await _helper.post(tagUrl, new_tag.toJson(), httpHeader());

    // Tag result = Tag.fromJson(response['tag']);

    return response;
  }
  // Future<ApiResponse<Map<String, dynamic>>> create_Tag(Tag new_tag) async {
  //   final response;
  //   _userdata = ApiResponse.loading("fetch created ..");
  //   try {
  //     response = await _helper.post(tagUrl, new_tag.toJson(), httpHeader());
  //     _userdata = ApiResponse.completed(response);
  //   } catch (e) {
  //     _userdata = ApiResponse.error("tag created failed..");
  //   }

  //   return _userdata;
  // }
}
/*
 .create_Tag(Tag(
                name: addController.text,
                createdAt: DateTime.now().toString(),
                // id: "",
                updatedAt: DateTime.now().toString()))
*/
