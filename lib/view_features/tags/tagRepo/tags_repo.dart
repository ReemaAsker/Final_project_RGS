import 'package:gsg_final_project_rgs/cores/utils/constants.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../../../cores/helpers/token_helper.dart';
import '../../../models/tag.dart';

class TagRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Tag>> fetchAllTagsWithoutEmail() async {
    String url = tagUrl;
    final response = await _helper.get(url, httpHeader());
    List<Tag>? result = TagsResponseModel.fromJson(response).tags;
    return result!;
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

    final response = await _helper.get(url, httpHeader());

    List<Tag>? result = TagsResponseModel.fromJson(response).tags;

    return result;
  }

  Future<List<Tag>?> fetchTagsOfMail({required int mailId}) async {
    String url = mailsUrl + '/$mailId/tags';

    final response = await _helper.get(url, httpHeader());

    List<Tag>? result = TagsResponseModel.fromJson(response).tags;

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
}
