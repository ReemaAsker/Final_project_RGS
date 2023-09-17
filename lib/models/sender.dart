import 'dart:convert';

import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/Category.dart';
import 'package:gsg_final_project_rgs/view_features/home/categories/models/category_response.dart';

class Sender {
  String? id;
  String? name;
  String? mobile;
  String? address;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  // CategoryModel? category;

  Sender({
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    // this.category,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        address: json["address"],
        categoryId: json["category_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        // category: json["category"] == null
        // ? null
        // : CategoryModel.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "name": name ?? "",
        "mobile": mobile ?? "",
        "address": address,
        "category_id": categoryId ?? "",
        "created_at": createdAt ?? "",
        "updated_at": updatedAt ?? "",
        // "category": category?.toJson(),
      };
}
