import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/cores/helpers/token_helper.dart';
import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:gsg_final_project_rgs/models/tag.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../cores/helpers/api_base_helper.dart';

class TagRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  late ApiResponse<Map<String, dynamic>> _userdata;

  Future<ApiResponse<Map<String, dynamic>>> create_Tag(Tag new_tag) async {
    final response;
    _userdata = ApiResponse.loading("fetch created ..");
    try {
      response = await _helper.post(tagUrl, new_tag.toJson(), httpHeader());
      _userdata = ApiResponse.completed(response);
    } catch (e) {
      _userdata = ApiResponse.error("tag created failed..");
    }
    // Tag createdTag = Tag.fromJson(new_tag.toJson());
    // int.parse(createdTag.id!);
    return _userdata;
  }
}
