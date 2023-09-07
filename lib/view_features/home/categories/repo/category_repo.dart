import 'package:gsg_final_project_rgs/cores/helpers/api_base_helper.dart';

import '../../../../cores/utils/constants.dart';
import '../models/category_response.dart';

class CategoryRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  String userToken = '282|CX4Sg0qj1bHRjIK3JrywqzTyrLsYQp3kFkxW99Xd';
  // await getToken();

  Future<List<Categories>?> fetchCategories() async {
    // String token = '282|CX4Sg0qj1bHRjIK3JrywqzTyrLsYQp3kFkxW99Xd';
    // //await getToken();
    final response = await _helper.get(categoriesUrl, {
      'Authorization': 'Bearer $userToken',
    });
    return CategoryResponseModel.fromJson(response).categories;
  }
}
