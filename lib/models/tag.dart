// import 'package:gsg_final_project_rgs/models/pivot.dart';

// class Tags {
//   int? id;
//   String? name;
//   String? createdAt;
//   String? updatedAt;
//   Pivot? pivot;

//   Tags({this.id, this.name, this.createdAt, this.updatedAt, this.pivot});

//   Tags.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot!.toJson();
//     }
//     return data;
//   }
// }
import 'package:gsg_final_project_rgs/models/pivot.dart';

class TagsResponseModel {
  List<Tag>? tags;

  TagsResponseModel({this.tags});

  TagsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['tags'] != null) {
      tags = <Tag>[];
      json['tags'].forEach((v) {
        tags!.add(new Tag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tag {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tag({this.id, this.name, this.createdAt, this.updatedAt, this.pivot});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot?.toJson(),
      };
}
