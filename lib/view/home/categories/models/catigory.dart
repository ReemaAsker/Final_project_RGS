import 'package:gsg_final_project_rgs/models/sender.dart';

class CatigoryResponse {
  List<Category>? categories;

  CatigoryResponse({this.categories});

  CatigoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleCatigoryResponse {
  List<Category>? category;

  SingleCatigoryResponse({this.category});

  SingleCatigoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
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

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? sendersCount;
  List<Sender>? senders;

  Category(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.sendersCount,
      this.senders});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sendersCount = json['senders_count'];
    if (json['senders'] != null) {
      senders = <Sender>[];
      json['senders'].forEach((v) {
        senders!.add(new Sender.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['senders_count'] = this.sendersCount;
    if (this.senders != null) {
      data['senders'] = this.senders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}