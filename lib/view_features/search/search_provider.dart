import 'package:flutter/cupertino.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/view_features/search/search_repository.dart';

class SearchProvider extends ChangeNotifier {
  late SearchRepo _searchRepo;
  late ApiResponse<List<MailClass>> _searchResult;

  ApiResponse<List<MailClass>> get searchResult => _searchResult;

  SearchProvider() {
    _searchRepo = SearchRepo();
  }

  // Future<ApiResponse<List<MailClass>>> searchForText(String searchQuery) async {
  //   _searchResult = ApiResponse.loading("searching");
  //   notifyListeners();
  //   try {
  //     SearchResponseModel result =
  //         await _searchRepo.search(searchQuery: searchQuery);
  //     _searchResult = ApiResponse.completed(result.mails);
  //     notifyListeners();
  //     return _searchResult;
  //   } catch (e) {
  //     _searchResult = ApiResponse.error(e.toString());
  //     notifyListeners();
  //     return _searchResult;
  //   }
  // }
}
