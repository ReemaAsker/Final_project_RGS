import 'package:flutter/cupertino.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/view/home/categories/models/catigory.dart';

import '../repositories/category_repo.dart';

class CategoryProvider extends ChangeNotifier {
  late CategoryRepo _categoryRepo;
  late ApiResponse<List<Category>> _categoryList;
  late ApiResponse<Category> _category;

  ApiResponse<List<Category>> get categoryList => _categoryList;
  ApiResponse<Category> get category => _category;

  CategoryProvider() {
    _categoryRepo = CategoryRepo();
    fetchCategoryList();
  }

  fetchCategory(int categoryId) async {
    _category = ApiResponse.loading('Fetching Category');
    notifyListeners();
    try {
      Category? category = await _categoryRepo.fetchCategory(categoryId);
      _category = ApiResponse.completed(category);
      notifyListeners();
    } catch (e) {
      _category = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  fetchCategoryList() async {
    _categoryList = ApiResponse.loading('Fetching Categories');
    notifyListeners();
    try {
      List<Category>? categories = await _categoryRepo.fetchCategoriesList();
      _categoryList = ApiResponse.completed(categories);
      notifyListeners();
    } catch (e) {
      _categoryList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
