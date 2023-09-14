import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/category_response.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../../../cores/helpers/token_helper.dart';
import '../categories/models/Category.dart';

class CategoryRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();
  // String? userToken = getToken() == null
  //     ? '883|NoOJXjvg0hIYwLbe3dzUZixQflr0iFqyiT0INttm'
  //     : getToken()!
  //         .token; // String userToken = "265|ksxcuVB3yjlAc44e76tblGvsoae68HxNiyjuIW7O";
  String? userToken = getToken()!.token;
  Future<List<CategoryModel>?> fetchCategoriesList() async {
    final response = await _helper.get(categoriesUrl,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});

    // print("fetchCategoriesList/////////////////////////Responses");
    // print(CatigoryResponse.fromJson(response));
    // print(response);
    // print("//////////");
    // List<CategoryModel>? result =
    //     CategoryResponseModel.fromJson(response).categories;
    List<CategoryModel>? result =
        CategoryResponseModel.fromJson(response).categories;
    // print(result.categories);
    return result;
    // print(result);
    // if (result != null) return result;
    // return [];
  }

  Future<CategoryModel?> fetchCategory(int categoryId) async {
    String url = categoriesUrl + '/$categoryId';
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accepy': 'application/json'});

    List<CategoryModel>? result =
        SingleCatigoryResponse.fromJson(response).category;
    // print("fetchCategory");
    // print(response);
    // print(result!.length);
    if (result != null) {
      // print(result![0].name);
      return result![0];
    } else {
      return null;
    }
  }

  Future<List<MailClass>?> fetchCategoryMails(int categoryId) async {
    String url = categoriesUrl + '/$categoryId/mails';
    final response = await _helper.get(url,
        {'Authorization': 'Bearer $userToken', 'Accept': 'application/json'});

    /// to do:
    List<MailClass>? result = CategoryMails.fromJson(response).mails;
    // print(
    //     "fetchCategoryMails//////////////////////////////////////////////////");
    // print(response);
    // print(result!.length);
    return result;
  }

// Future<CategoryModel?> createCategory(String name) async {
  //   String url = categoriesUrl;
  //   final response = await _helper.post(url, {
  //     'Authorization': 'Bearer $userToken',
  //   }, {
  //     'name': name
  //   });
  //   print(response);
  //   CategoryModel result = CategoryModel.fromJson(response['category']);
  //   print("createCategory");
  //
  //   print(result.name);
  //   return result;
  // }
}
