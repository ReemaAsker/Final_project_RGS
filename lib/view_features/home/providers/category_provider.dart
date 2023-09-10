import 'package:flutter/cupertino.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/Category.dart';

import '../repositories/category_repo.dart';

class CategoryProvider extends ChangeNotifier {
  late CategoryRepo _categoryRepo;
  late ApiResponse<List<CategoryModel>> _categoryList;
  late ApiResponse<CategoryModel> _category;

  ApiResponse<List<CategoryModel>> get categoryList => _categoryList;
  ApiResponse<CategoryModel> get category => _category;

  CategoryProvider() {
    _categoryRepo = CategoryRepo();
    fetchCategoryList();
  }

  fetchCategory(int categoryId) async {
    _category = ApiResponse.loading('Fetching Category');
    notifyListeners();
    try {
      CategoryModel? category = await _categoryRepo.fetchCategory(categoryId);
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
      List<CategoryModel>? categories = await _categoryRepo.fetchCategoriesList();
      _categoryList = ApiResponse.completed(categories);
      notifyListeners();
    } catch (e) {
      _categoryList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
