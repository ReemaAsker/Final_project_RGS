import 'package:flutter/widgets.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';

import '../../../models/tag.dart';
import '../repositories/tags_repo.dart';

class TagsProvider extends ChangeNotifier {
  late TagRepo _tagRepo;

  late ApiResponse<List<Tag>> _allTagsList;
  late ApiResponse<List<Tag>> _tagsListWithMails;
  late ApiResponse<List<Tag>> _tagsOfMail;
  late ApiResponse<Map<String, dynamic>> _tag;

  ApiResponse<List<Tag>> get allTagsList => _allTagsList;

  ApiResponse<Map<String, dynamic>> get tag => _tag;

  ApiResponse<List<Tag>> get tagsListWithMails => _tagsListWithMails;

  ApiResponse<List<Tag>> get tagsOfMail => _tagsOfMail;

  TagsProvider() {
    _tagRepo = TagRepo();
    fetchAllTagsList();
  }
  fetchAllTagsList() async {
    _allTagsList = ApiResponse.loading('Fetching Links');
    notifyListeners();
    try {
      List<Tag> tags = await _tagRepo.fetchAllTagsWithoutEmail();
      _allTagsList = ApiResponse.completed(tags);
      notifyListeners();
    } catch (e) {
      _allTagsList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  // fetchAllTagsList() async {
  //   print("*********************************************");

  //   _allTagsList = ApiResponse.loading('Fetching Tags');
  //   notifyListeners();
  //   try {
  //     List<Tag>? tags = await _tagRepo.fetchAllTagsWithoutEmail();
  //     print("*********************************************");
  //     print(tags);
  //     print("*********************************************");
  //     _allTagsList = ApiResponse.completed(tags);

  //     notifyListeners();
  //   } catch (e) {
  //     // print("in catch tags");
  //     _allTagsList = ApiResponse.error(e.toString());
  //     notifyListeners();
  //     rethrow;
  //   }
  // }

  fetchTagsListWithMail({required List<int> tags}) async {
    _tagsListWithMails = ApiResponse.loading('Fetching Tags with mails');
    notifyListeners();
    try {
      List<Tag>? tagsList = await _tagRepo.fetchTagsWithEmail(tags: tags);
      _tagsListWithMails = ApiResponse.completed(tagsList);
      notifyListeners();
    } catch (e) {
      _tagsListWithMails = ApiResponse.error(e.toString());
      notifyListeners();
      rethrow;
    }
  }

  fetchTagsOfMail({required int mailId}) async {
    _tagsOfMail = ApiResponse.loading('Fetching Tags ');
    notifyListeners();
    try {
      List<Tag>? mailTagsList = await _tagRepo.fetchTagsOfMail(mailId: mailId);
      _tagsOfMail = ApiResponse.completed(mailTagsList);
      notifyListeners();
    } catch (e) {
      _tagsOfMail = ApiResponse.error(e.toString());
      notifyListeners();
      rethrow;
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> createTag(
      {required String name}) async {
    _tag = ApiResponse.loading('creating tag ');
    notifyListeners();
    try {
      Map<String, dynamic> myTag = await _tagRepo.createTag(name: name);
      _tag = ApiResponse.completed(myTag);
      fetchAllTagsList();

      notifyListeners();
    } catch (e) {
      _tag = ApiResponse.error(e.toString());
      notifyListeners();
    }
    return _tag;
  }
}
