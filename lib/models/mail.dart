// import 'package:gsg_final_project_rgs/models/activity.dart';
// import 'package:gsg_final_project_rgs/models/attachment.dart';
// import 'package:gsg_final_project_rgs/models/sender.dart';
// import 'package:gsg_final_project_rgs/models/status.dart';
// import 'package:gsg_final_project_rgs/models/tag.dart';

// class Mail {
//   int? id;
//   late String subject;
//   String? description;
//   String? senderId;
//   late String archiveNumber;
//   late String archiveDate;
//   String? decision;
//   int statusId = 1;
//   String? finalDecision;
//   String? createdAt;
//   String? updatedAt;
//   Sender? sender;
//   Status? status;
//   List<Tags>? tags;
//   List<Attachment>? attachments;
//   List<Activitie>? activities;

//   Mail(
//       {this.id,
//       required this.subject,
//       this.description,
//       this.senderId,
//       required this.archiveNumber,
//       required this.archiveDate,
//       this.decision,
//       required this.statusId,
//       this.finalDecision,
//       this.createdAt,
//       this.updatedAt,
//       this.sender,
//       this.status,
//       this.tags,
//       this.attachments,
//       this.activities});

//   Mail.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     subject = json['subject'];
//     description = json['description'];
//     senderId = json['sender_id'];
//     archiveNumber = json['archive_number'];
//     archiveDate = json['archive_date'];
//     decision = json['decision'];
//     statusId = json['status_id'];
//     finalDecision = json['final_decision'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     sender =
//         json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
//     status =
//         json['status'] != null ? new Status.fromJson(json['status']) : null;
//     if (json['tags'] != null) {
//       tags = <Tags>[];
//       json['tags'].forEach((v) {
//         tags!.add(new Tags.fromJson(v));
//       });
//     }
//     if (json['attachments'] != null) {
//       attachments = <Attachment>[];
//       json['attachments'].forEach((v) {
//         attachments!.add(new Attachment.fromJson(v));
//       });
//     }
//     if (json['activities'] != null) {
//       activities = <Activitie>[];
//       json['activities'].forEach((v) {
//         activities!.add(new Activitie.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['subject'] = this.subject;
//     data['description'] = this.description;
//     data['sender_id'] = this.senderId;
//     data['archive_number'] = this.archiveNumber;
//     data['archive_date'] = this.archiveDate;
//     data['decision'] = this.decision;
//     data['status_id'] = this.statusId;
//     data['final_decision'] = this.finalDecision;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.sender != null) {
//       data['sender'] = this.sender!.toJson();
//     }
//     if (this.status != null) {
//       data['status'] = this.status!.toJson();
//     }
//     if (this.tags != null) {
//       data['tags'] = this.tags!.map((v) => v.toJson()).toList();
//     }
//     if (this.attachments != null) {
//       data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
//     }
//     if (this.activities != null) {
//       data['activities'] = this.activities!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////////////
// To parse this JSON data, do
//
//     final mail = mailFromJson(jsonString);

import 'dart:convert';

import 'package:gsg_final_project_rgs/models/activity.dart';
import 'package:gsg_final_project_rgs/models/pivot.dart';
import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/models/tag.dart';

Mail mailFromJson(String str) => Mail.fromJson(json.decode(str));

String mailToJson(Mail data) => json.encode(data.toJson());

class Mail {
  String? message;
  MailClass? mail;

  Mail({
    this.message,
    this.mail,
  });

  factory Mail.fromJson(Map<String, dynamic> json) => Mail(
        message: json["message"],
        mail: json["mail"] == null ? null : MailClass.fromJson(json["mail"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "mail": mail?.toJson(),
      };
}

class MailClass {
  int? id;
  String? subject;
  dynamic description;
  String? senderId;
  String? archiveNumber;
  String? archiveDate;
  dynamic decision;
  String? statusId;
  dynamic finalDecision;
  String? createdAt;
  String? updatedAt;
  dynamic sender;
  Status? status;
  List<dynamic>? attachments;
  List<Activity>? activities;
  List<dynamic>? tags;

  MailClass({
    this.id,
    this.subject,
    this.description,
    this.senderId,
    this.archiveNumber,
    this.archiveDate,
    this.decision,
    this.statusId,
    this.finalDecision,
    this.createdAt,
    this.updatedAt,
    this.sender,
    this.status,
    this.attachments,
    this.activities,
    this.tags,
  });

  factory MailClass.fromJson(Map<String, dynamic> json) => MailClass(
        id: json["id"],
        subject: json["subject"],
        description: json["description"],
        senderId: json["sender_id"],
        archiveNumber: json["archive_number"],
        archiveDate: json["archive_date"],
        decision: json["decision"],
        statusId: json["status_id"],
        finalDecision: json["final_decision"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        sender: json["sender"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        attachments: json["attachments"] == null
            ? []
            : List<dynamic>.from(json["attachments"]!.map((x) => x)),
        activities: json["activities"] == null
            ? []
            : List<Activity>.from(
                json["activities"]!.map((x) => Activity.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<Status>.from(json["tags"]!.map((x) => Status.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "description": description,
        "sender_id": senderId,
        "archive_number": archiveNumber,
        "archive_date": archiveDate,
        "decision": decision,
        "status_id": statusId,
        "final_decision": finalDecision,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "sender": sender,
        "status": status?.toJson(),
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x)),
        "activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
        "tags": tags == null
            ? []
            : tags![0].runtimeType != int
                ? List<dynamic>.from(tags!.map((x) => x.toJson()))
                : List<dynamic>.from(tags!.map((x) => x)),
      };
}
