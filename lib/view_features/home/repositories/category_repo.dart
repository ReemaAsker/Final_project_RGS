import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/category_response.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../categories/models/Category.dart';

class CategoryRepo {
  final ApiBaseHelper _helper = ApiBaseHelper();
  // Future<String> userToken = getToken();
  String userToken = "265|ksxcuVB3yjlAc44e76tblGvsoae68HxNiyjuIW7O";

  Future<List<CategoryModel>?> fetchCategoriesList() async {
    late final response;

    response = await _helper.get(categoriesUrl, {
      'Authorization': 'Bearer $userToken',
    });

    // print("fetchCategoriesList/////////////////////////Responses");
    // print(CatigoryResponse.fromJson(response));
    // print(response);
    // print("//////////");
    List<CategoryModel>? result = CategoryResponseModel.fromJson(response).categories;
    // print(result.categories);
    return result;
    // print(result);
    // if (result != null) return result;
    // return [];
  }

  Future<CategoryModel?> fetchCategory(int categoryId) async {
    String url = categoriesUrl + '/$categoryId';
    final response = await _helper.get(url, {
      'Authorization': 'Bearer $userToken',
    });

    List<CategoryModel>? result = SingleCatigoryResponse.fromJson(response).category;
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

  Future<CategoryModel?> createCategory(String name) async {
    String url = categoriesUrl;
    final response = await _helper.post(url, {
      'Authorization': 'Bearer $userToken',
    }, {
      'name': name
    });
    print(response);
    CategoryModel result = CategoryModel.fromJson(response['category']);
    print("createCategory");

    print(result.name);
    return result;
  }
}
