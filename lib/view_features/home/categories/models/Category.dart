// import 'package:gsg_final_project_rgs/models/sender.dart';

// class CategoryResponse {
//   List<Category>? categories;

//   CategoryResponse({this.categories});
//   CategoryResponse.fromJson(Map<String, dynamic> json) {
//     if (json['categories'] != null) {
//       categories = <Category>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Category.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class SingleCatigoryResponse {
//   List<Category>? category;

//   SingleCatigoryResponse({this.category});

//   SingleCatigoryResponse.fromJson(Map<String, dynamic> json) {
//     if (json['category'] != null) {
//       category = <Category>[];
//       json['category'].forEach((v) {
//         category!.add(new Category.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.category != null) {
//       data['category'] = this.category!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? name;
//   String? createdAt;
//   String? updatedAt;
//   String? sendersCount;
//   List<Sender>? senders;

//   Category(
//       {this.id,
//       this.name,
//       this.createdAt,
//       this.updatedAt,
//       this.sendersCount,
//       this.senders});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     sendersCount = json['senders_count'];
//     if (json['senders'] != null) {
//       senders = <Sender>[];
//       json['senders'].forEach((v) {
//         senders!.add(new Sender.fromJson(v));
//       });
//     }
//   }

import 'dart:convert';

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['senders_count'] = this.sendersCount;
//     if (this.senders != null) {
//       data['senders'] = this.senders!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

import 'package:gsg_final_project_rgs/models/sender.dart';

import '../../../../models/mail.dart';

class CategoryModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? sendersCount;
  List<Sender>? senders;

  CategoryModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.sendersCount,
    this.senders,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        sendersCount: json["senders_count"],
        senders: json["senders"] == null
            ? []
            : List<Sender>.from(
                json["senders"]!.map((x) => Sender.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "senders_count": sendersCount,
        "senders": senders == null
            ? []
            : List<dynamic>.from(senders!.map((x) => x.toJson())),
      };
}

// To parse this JSON data, do
//
//     final categoryMails = categoryMailsFromJson(jsonString);

CategoryMails categoryMailsFromJson(String str) =>
    CategoryMails.fromJson(json.decode(str));

String categoryMailsToJson(CategoryMails data) => json.encode(data.toJson());

class CategoryMails {
  List<MailClass>? mails;

  CategoryMails({
    this.mails,
  });

  factory CategoryMails.fromJson(Map<String, dynamic> json) => CategoryMails(
        mails: json["mails"] == null
            ? []
            : List<MailClass>.from(
                json["mails"]!.map((x) => MailClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mails": mails == null
            ? []
            : List<dynamic>.from(mails!.map((x) => x.toJson())),
      };
}
