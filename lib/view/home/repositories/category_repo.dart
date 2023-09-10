import 'package:gsg_final_project_rgs/cores/utils/constants.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../categories/models/catigory.dart';

class CategoryRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();
  // Future<String> userToken = getToken();
  String userToken = "265|ksxcuVB3yjlAc44e76tblGvsoae68HxNiyjuIW7O";

  Future<List<Category>?> fetchCategoriesList() async {
    late final response;

    response = await _helper.get(categoriesUrl, {
      'Authorization': 'Bearer $userToken',
    });

    // print("fetchCategoriesList/////////////////////////Responses");
    // print(CatigoryResponse.fromJson(response));
    // print(response);
    // print("//////////");
    List<Category>? result = CatigoryResponse.fromJson(response).categories;
    // print(result.categories);
    return result;
    // print(result);
    // if (result != null) return result;
    // return [];
  }

  Future<Category?> fetchCategory(int categoryId) async {
    String url = categoriesUrl + '/$categoryId';
    final response = await _helper.get(url, {
      'Authorization': 'Bearer $userToken',
    });

    List<Category>? result = SingleCatigoryResponse.fromJson(response).category;
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

  Future<Category?> createCategory(String name) async {
    String url = categoriesUrl;
    final response = await _helper.post(url, {
      'Authorization': 'Bearer $userToken',
    }, {
      'name': name
    });
    print(response);
    Category result = Category.fromJson(response['category']);
    print("createCategory");

    print(result.name);
    return result;
  }
}
