import 'package:gsg_final_project_rgs/cores/helpers/api_base_helper.dart';

import '../../cores/helpers/token_helper.dart';
import '../../cores/utils/constants.dart';
import '../../models/search_model.dart';

class SearchRepo {
  ApiBaseHelper _helper = ApiBaseHelper();
  String? userToken = getToken()!.token;

  Future<SearchResponseModel> search(
      {required String searchQuery,
      required String fromDate,
      required String toDate}) async {
    String url =
        searchkUrl + "?text=$searchQuery&start=$fromDate&end=$toDate&status_id";
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});

    SearchResponseModel result = SearchResponseModel.fromJson(response);
    return result;

    //Future<List<MailClass>?> fetchCategoryMails(int categoryId) async {
    //     String url = categoriesUrl + '/$categoryId/mails';
    //     final response = await _helper.get(url,
    //         {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});
    //
    //     /// to do:
    //     List<MailClass>? result = CategoryMails.fromJson(response).mails;
    //     // print(
    //     //     "fetchCategoryMails//////////////////////////////////////////////////");
    //     // print(response);
    //     // print(result!.length);
    //     return result;
    //   }
  }
  //Future<Search> searchByName(context, Map<String, dynamic> body) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   var user = userFromJson(prefs.getString('user')!);
  //
  //   final response = await http.post(
  //     Uri.parse(searchURL),
  //     headers: {'Authorization': 'Bearer ${user.token}'},
  //     body: body,
  //   );
  //
  //   if (response.statusCode == 200) {
  //     // final data = jsonDecode(response.body)['user'] as List<dynamic>;
  //     // print(data);
  //     //
  //     // return data.map((e) => User.fromJson(e)).toList();
  //     final Map<String, dynamic> data = json.decode(response.body);
  //     return Search.fromJson(data);
  //   }
  //
  //   if (response.statusCode == 401) {
  //     Navigator.pushReplacementNamed(context, ProfileView.id);
  //   }
  //
  //   return Future.error('Search Faild');
  // }

  // TextEditingController searchController = TextEditingController();
  //   final _formKey = GlobalKey<FormState>();
  //   late Future<Search> fSearch;
  //   late String searchQuery = "";
  //
  //   updateUI() {
  //     setState(() {
  //       fSearch = search();
  //     });
  //   }
  // Future<Search> search() async {
  //     Map<String, dynamic> body = {'name': searchQuery};
  //     return searchByName(context, body);
  //   }
  //Future builder
}
