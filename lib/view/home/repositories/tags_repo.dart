import 'package:gsg_final_project_rgs/cores/utils/constants.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../../../models/tag.dart';

class TagRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();

  // Future<String> userToken = getToken();
  String userToken = "265|ksxcuVB3yjlAc44e76tblGvsoae68HxNiyjuIW7O";

  Future<List<Tag>?> fetchAllTagsWithoutEmail() async {
    String url = tagUrl;
    final response = await _helper.get(url, {
      'Authorization': 'Bearer $userToken',
    });
    //   print("In fetchStatusesWithMail//////////////////////////////////");
    // print(response);
    List<Tag>? result = TagsResponseModel.fromJson(response).tags;
    // print("000000000000000000000000");
    // print(result![0].name);
    return result;
  }

  Future<List<Tag>?> fetchTagsWithEmail({required List<int> tags}) async {
    String url = tagUrl + '?tags=[';
    for (int i = 0; i < tags.length; i++) {
      url += tags[i].toString();
      if (i < tags.length - 1) {
        url += ","; // Add a semicolon if it's not the last element
      }
    }
    url += ']';

    print(tagUrl);
    print(url);
    final response = await _helper.get(url, {
      'Authorization': 'Bearer $userToken',
    });
    print("In fetchTagsWithEmail//////////////////////////////////");
    print(response);
    List<Tag>? result = TagsResponseModel.fromJson(response).tags;
    print("000000000000000000000000");
    print(result![0].id);
    return result;
  }

  Future<List<Tag>?> fetchTagsOfMail({required int mailId}) async {
    //  /mails/2/tags
    String url = mailsUrl + '/$mailId/tags';

    print(url);
    final response = await _helper.get(url, {
      'Authorization': 'Bearer $userToken',
    });
    print("In ffetchMailTags//////////////////////////////////");
    print(response);
    List<Tag>? result = TagsResponseModel.fromJson(response).tags;
    print("000000000000000000000000");
    print(result);
    return result;
  }

  Future<Tag?> createTag({required String name}) async {
    String url = tagUrl;
    final response = await _helper.post(url, {
      'Authorization': 'Bearer $userToken',
    }, {
      'name': name
    });
    // print(response);
    Tag result = Tag.fromJson(response['tag']);
    // print("createTag");
    // print(result.name);
    //
    // print(result.name);
    return result;
  }
}
