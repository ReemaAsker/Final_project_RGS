import 'package:flutter/foundation.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/repo/category_repo.dart';

import '../models/category_response.dart';

class CategoryProvider extends ChangeNotifier {
  late ApiResponse<List<Categories>> _categories;
  late CategoryRepository _categoriesRepo;
  ApiResponse<List<Categories>> get categories => _categories;

  CategoryProvider() {
    _categoriesRepo = CategoryRepository();

    _fetchCategories();
  }

  _fetchCategories() async {
    _categories = ApiResponse.loading('Loding..');
    notifyListeners();
    try {
      List<Categories>? categories_list =
          await _categoriesRepo.fetchCategories();

      _categories = ApiResponse.completed(categories_list);
      notifyListeners();
    } catch (e) {
      _categories = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
