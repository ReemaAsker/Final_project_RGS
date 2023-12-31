import 'package:flutter/cupertino.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/models/mail.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/Category.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/category_ui_status.dart';

import '../categories/models/category_content.dart';
import '../repositories/category_repo.dart';

class CategoryProvider extends ChangeNotifier {
  late CategoryRepo _categoryRepo;
  late ApiResponse<List<CategoryModel>> _categoryList;
  late ApiResponse<CategoryModel> _category;
  late ApiResponse<List<MailClass>> _categoryMails;
  late CategoryUiStatus categoryUiStatus;

  late ApiResponse<Map<int, List<MailClass>>> _categoriesWithMails;
  // late ApiResponse<Map<int, List<MailClass>>> _categoriesWithMails;

  ApiResponse<Map<int, List<MailClass>>> get categoriesWithMails =>
      _categoriesWithMails;

  // ApiResponse<List<MailClass>> get categoryMails => _categoryMails;

  ApiResponse<List<CategoryModel>> get categoryList => _categoryList;
  ApiResponse<CategoryModel> get category => _category;

  List<CategoryContentUI> categoriesWithMailsAsContent = [];

  CategoryProvider() {
    _categoryRepo = CategoryRepo();
    fetchCategoryList();
    fetchCategoriesWithMails();
    // fetchCategoryMails();
    // fetchAllCategoriesWithMails();
  }

  Future<ApiResponse<CategoryModel>> fetchCategory(int categoryId) async {
    _category = ApiResponse.loading('Fetching Category');
    notifyListeners();
    try {
      CategoryModel? category = await _categoryRepo.fetchCategory(categoryId);
      _category = ApiResponse.completed(category);

      notifyListeners();
      return _category;
    } catch (e) {
      _category = ApiResponse.error(e.toString());

      notifyListeners();
      return _category;
    }
  }

// Future<ApiResponse<List<MailClass>>>
//   fetchCategoryMails(int categoryId) async {
//     _categoryMails = ApiResponse.loading('Fetching Category Mails');
//     notifyListeners();
//
//     try {
//       List<MailClass>? mails =
//           await _categoryRepo.fetchCategoryMails(categoryId);
//       print(" fetchCategoryMail ");
//       // print("${mails?[0].statusId}");
//       _categoryMails = ApiResponse.completed(mails);
//
//       notifyListeners();
//       // return _categoryMails.data!;
//     } catch (e) {
//       _categoryMails = ApiResponse.error(e.toString());
//       Future.delayed(Duration(seconds: 0), () {
//         notifyListeners();
//       });
//       // return _categoryMails.data ?? [];
//     }
//   }

  fetchCategoryList() async {
    _categoryList = ApiResponse.loading('Fetching Categories');
    notifyListeners();
    try {
      List<CategoryModel>? categories =
          await _categoryRepo.fetchCategoriesList();
      _categoryList = ApiResponse.completed(categories);
      notifyListeners();
    } catch (e) {
      _categoryList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  fetchCategoriesWithMails() async {
    // _categoryList = ApiResponse.loading('Fetching Categories');
    categoryUiStatus = CategoryUiStatus(isLoading: true);
    notifyListeners();
    try {
      List<CategoryModel>? categories =
          await _categoryRepo.fetchCategoriesList();

      // call category mails function
      // _categoryList = ApiResponse.completed(categories);
      for (int i = 1; i <= categories!.length; i++) {
        List<MailClass>? categoryMails =
            await _categoryRepo.fetchCategoryMails(i);
        CategoryContentUI iCategoryContent = CategoryContentUI(
            category: categories[i - 1], mails: categoryMails!);

        categoriesWithMailsAsContent.add(iCategoryContent);
        //  get this category mails as list
        //  create an categoryContentUI with this category and its mails
        //  add this categoryContent ui to the above list of catrgory content ui
      }
      categoryUiStatus = CategoryUiStatus(
          isSuccess: true, categoriesContent: categoriesWithMailsAsContent);
      notifyListeners();
    } catch (e) {
      print("********************************************" + e.toString());
      // _categoryList = ApiResponse.error(e.toString());
      categoryUiStatus =
          CategoryUiStatus(isError: true, errorMessage: e.toString());
      notifyListeners();
      rethrow;
    }
  }

  // fetchCategoriesWihMails() async {
  //   _categoriesWithMails = ApiResponse.loading('Fetching Categories');
  //   notifyListeners();
  //   try {
  //     Map<int, List<MailClass>> myMap = {1: [], 2: [], 3: [], 4: []};
  //     for (int id in [1, 2, 3, 4]) {
  //       List<MailClass>? mycategoryMails =
  //           // await _categoryRepo.fetchCategoryMails(id);
  //           await fetchCategoryMails(id);
  //       myMap[id] = mycategoryMails!;
  //     }
  //     _categoriesWithMails = ApiResponse.completed(myMap);
  //     notifyListeners();
  //     // List<CategoryModel>? categories =
  //     // await _categoryRepo.fetchCategoriesList();
  //     // _categoryList = ApiResponse.completed(categories);
  //     // notifyListeners();
  //   } catch (e) {
  //     _categoriesWithMails = ApiResponse.error(e.toString());
  //     notifyListeners();
  //     print(e);
  //   }
  // }

  // fetchAllCategoriesWithMails() async {
  //   _categoriesWithMails = ApiResponse.loading('Fetching Categories');
  //   notifyListeners();
  //   try {
  //     for (CategoryModel element in _categoryList.data!) {
  //       fetchCategoryMails(element.id!);
  //       _categoriesWithMails.data![element.id!] = _categoryMails.data!;
  //     }
  //   } catch (e) {
  //     _categoriesWithMails = ApiResponse.error(e.toString());
  //     notifyListeners();
  //   }
  // }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'package:flutter/cupertino.dart';
// import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
// import 'package:gsg_final_project_rgs/models/mail.dart';
// import 'package:gsg_final_project_rgs/view_features/home/categories/models/Category.dart';
//
// import '../repositories/category_repo.dart';
//
// class CategoryProvider extends ChangeNotifier {
//   late CategoryRepo _categoryRepo;
//   late ApiResponse<List<CategoryModel>> _categoryList;
//   late ApiResponse<CategoryModel> _category;
//   late ApiResponse<List<MailClass>> _categoryMails;
//
//   late ApiResponse<Map<int, List<MailClass>>> _categoriesWithMails;
//   // late ApiResponse<Map<int, List<MailClass>>> _categoriesWithMails;
//
//   ApiResponse<Map<int, List<MailClass>>> get categoriesWithMails =>
//       _categoriesWithMails;
//
//   ApiResponse<List<MailClass>> get categoryMails => _categoryMails;
//
//   ApiResponse<List<CategoryModel>> get categoryList => _categoryList;
//   ApiResponse<CategoryModel> get category => _category;
//
//   CategoryProvider() {
//     _categoryRepo = CategoryRepo();
//     fetchCategoryList();
//     // fetchCategoriesWihMails();
//     // fetchCategoryMails();
//     // fetchAllCategoriesWithMails();
//   }
//
//   Future<ApiResponse<CategoryModel>> fetchCategory(int categoryId) async {
//     _category = ApiResponse.loading('Fetching Category');
//     notifyListeners();
//     try {
//       CategoryModel? category = await _categoryRepo.fetchCategory(categoryId);
//       _category = ApiResponse.completed(category);
//
//       notifyListeners();
//       return _category;
//     } catch (e) {
//       _category = ApiResponse.error(e.toString());
//
//       notifyListeners();
//       return _category;
//     }
//   }
//
// // Future<ApiResponse<List<MailClass>>>
//   fetchCategoryMails(int categoryId) async {
//     _categoryMails = ApiResponse.loading('Fetching Category Mails');
//     notifyListeners();
//
//     try {
//       List<MailClass>? mails =
//           await _categoryRepo.fetchCategoryMails(categoryId);
//       print(" fetchCategoryMail ");
//       // print("${mails?[0].statusId}");
//       _categoryMails = ApiResponse.completed(mails);
//
//       notifyListeners();
//       // return _categoryMails.data!;
//     } catch (e) {
//       _categoryMails = ApiResponse.error(e.toString());
//       Future.delayed(Duration(seconds: 0), () {
//         notifyListeners();
//       });
//       // return _categoryMails.data ?? [];
//     }
//   }
//
//   fetchCategoryList() async {
//     _categoryList = ApiResponse.loading('Fetching Categories');
//     notifyListeners();
//     try {
//       List<CategoryModel>? categories =
//           await _categoryRepo.fetchCategoriesList();
//       _categoryList = ApiResponse.completed(categories);
//       notifyListeners();
//     } catch (e) {
//       _categoryList = ApiResponse.error(e.toString());
//       notifyListeners();
//     }
//   }
//
//   // fetchCategoriesWihMails() async {
//   //   _categoriesWithMails = ApiResponse.loading('Fetching Categories');
//   //   notifyListeners();
//   //   try {
//   //     Map<int, List<MailClass>> myMap = {1: [], 2: [], 3: [], 4: []};
//   //     for (int id in [1, 2, 3, 4]) {
//   //       List<MailClass>? mycategoryMails =
//   //           // await _categoryRepo.fetchCategoryMails(id);
//   //           await fetchCategoryMails(id);
//   //       myMap[id] = mycategoryMails!;
//   //     }
//   //     _categoriesWithMails = ApiResponse.completed(myMap);
//   //     notifyListeners();
//   //     // List<CategoryModel>? categories =
//   //     // await _categoryRepo.fetchCategoriesList();
//   //     // _categoryList = ApiResponse.completed(categories);
//   //     // notifyListeners();
//   //   } catch (e) {
//   //     _categoriesWithMails = ApiResponse.error(e.toString());
//   //     notifyListeners();
//   //     print(e);
//   //   }
//   // }
//
// // fetchAllCategoriesWithMails() async {
// //   _categoriesWithMails = ApiResponse.loading('Fetching Categories');
// //   notifyListeners();
// //   try {
// //     for (CategoryModel element in _categoryList.data!) {
// //       fetchCategoryMails(element.id!);
// //       _categoriesWithMails.data![element.id!] = _categoryMails.data!;
// //     }
// //   } catch (e) {
// //     _categoriesWithMails = ApiResponse.error(e.toString());
// //     notifyListeners();
// //   }
// // }
// }
