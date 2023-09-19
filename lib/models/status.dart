// import 'mail.dart';
//
// class StatusResponse {
//   List<Status>? statuses;
//
//   StatusResponse({this.statuses});
//
//   StatusResponse.fromJson(Map<String, dynamic> json) {
//     if (json['statuses'] != null) {
//       statuses = <Status>[];
//       json['statuses'].forEach((v) {
//         statuses!.add(new Status.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (this.statuses != null) {
//       data['statuses'] = this.statuses!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Status {
//   int? id;
//   String? name;
//   String? color;
//   String? createdAt;
//   String? updatedAt;
//   String? mailsCount;
//   List<MailClass>? mails;
//
//   Status(
//       {this.id,
//       this.name,
//       this.color,
//       this.createdAt,
//       this.updatedAt,
//       this.mailsCount,
//       this.mails});
//
//   Status.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     color = json['color'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     mailsCount = json['mails_count'];
//     if (json['mails'] != null) {
//       mails = <MailClass>[];
//       json['mails'].forEach((v) {
//         mails!.add(new MailClass.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['color'] = this.color;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['mails_count'] = this.mailsCount;
//     if (this.mails != null) {
//       data['mails'] = this.mails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// To parse this JSON data, do

// final statuses = statusesFromJson(jsonString);

import 'dart:convert';

import 'package:gsg_final_project_rgs/models/mail.dart';

Status statusesFromJson(String str) => Status.fromJson(json.decode(str));

String statusesToJson(Status data) => json.encode(data.toJson());

class Status {
  List<StatusElement>? statuses;

  Status({
    this.statuses,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        statuses: json["statuses"] == null
            ? []
            : List<StatusElement>.from(
                json["statuses"]!.map((x) => StatusElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuses": statuses == null
            ? []
            : List<dynamic>.from(statuses!.map((x) => x.toJson())),
      };
}

StatusElement statusElementFromJson(String str) =>
    StatusElement.fromJson(json.decode(str));

String statusElementToJson(StatusElement data) => json.encode(data.toJson());

class StatusElement {
  int? id;
  String? name;
  String? color;
  String? createdAt;
  String? updatedAt;
  String? mailsCount;
  List<MailClass>? mails;

  StatusElement({
    this.id,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.mailsCount,
    this.mails,
  });

  factory StatusElement.fromJson(Map<String, dynamic> json) => StatusElement(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        mailsCount: json["mails_count"],
        mails: json["mails"] == null
            ? []
            : List<MailClass>.from(
                json["mails"]!.map((x) => MailClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "mails_count": mailsCount,
        "mails": mails == null
            ? []
            : List<dynamic>.from(mails!.map((x) => x.toJson())),
      };
}
/////////////////////////////////////////////////////////////////////////
// class StatusElement {
//   int? id;
//   String? name;
//   String? color;
//   String? createdAt;
//   String? updatedAt;
//   String? mailsCount;
//   List<MailClass>? mails;
//
//   StatusElement({
//     this.id,
//     this.name,
//     this.color,
//     this.createdAt,
//     this.updatedAt,
//     this.mailsCount,
//     this.mails,
//   });
//
//   factory StatusElement.fromJson(Map<String, dynamic> json) => StatusElement(
//         id: json["id"],
//         name: json["name"],
//         color: json["color"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         mailsCount: json["mails_count"],
//         mails: json["mails"] == null
//             ? []
//             : List<MailClass>.from(
//                 json["mails"]!.map((x) => MailClass.fromJson(x))),
//       );
// /*
//         mails: json["mails"] == null
//             ? []
//             : List<Mail>.from(json["mails"]!.map((x) => Mail.fromJson(x))),
// */
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "color": color,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "mails_count": mailsCount,
//         "mails": mails == null
//             ? []
//             : List<dynamic>.from(mails!.map((x) => x.toJson())),
//       };
// }
