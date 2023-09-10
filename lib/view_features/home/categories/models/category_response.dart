import 'package:gsg_final_project_rgs/models/sender.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/Category.dart';

class CategoryResponseModel {
  List<CategoryModel>? categories;

  CategoryResponseModel({this.categories});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleCatigoryResponse {
  List<CategoryModel>? category;

  SingleCatigoryResponse({this.category});

  SingleCatigoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <CategoryModel>[];
      json['category'].forEach((v) {
        category!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
