// import 'dart:convert';

// import 'package:gsg_final_project_rgs/models/activity.dart';
// import 'package:gsg_final_project_rgs/models/attachment.dart';
// import 'package:gsg_final_project_rgs/models/sender.dart';
// import 'package:gsg_final_project_rgs/models/status.dart';

// Mail mailFromJson(String str) => Mail.fromJson(json.decode(str));

// String mailToJson(Mail data) => json.encode(data.toJson());

// class Mail {
//   String? message;
//   MailClass? mail;

//   Mail({
//     this.message,
//     this.mail,
//   });

//   factory Mail.fromJson(Map<String, dynamic> json) => Mail(
//         message: json["message"],
//         mail: json["mail"] == null ? null : MailClass.fromJson(json["mail"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "mail": mail?.toJson(),
//       };
// }

// MailClass mailClassFromJson(String str) => MailClass.fromJson(json.decode(str));

// String mailClassToJson(MailClass data) => json.encode(data.toJson());

// class MailClass {
//   int? id;
//   String subject;
//   String? description;
//   String? senderId;
//   String archiveNumber;
//   String archiveDate;
//   String? decision;
//   int? statusId;
//   String? finalDecision;
//   String? createdAt;
//   String? updatedAt;
//   Sender? sender;
//   StatusElement? status; //status
//   List<Attachment>? attachments;
//   List<Activity>? activities;
//   List<dynamic>? tags;

//   MailClass({
//     this.id,
//     required this.subject,
//     this.description,
//     this.senderId,
//     required this.archiveNumber,
//     required this.archiveDate,
//     this.decision,
//     this.statusId,
//     this.finalDecision,
//     this.createdAt,
//     this.updatedAt,
//     this.sender,
//     this.status,
//     this.attachments,
//     this.activities,
//     this.tags,
//   });

//   factory MailClass.fromJson(Map<String, dynamic> json) {
//     MailClass v = MailClass(subject: "", archiveNumber: "", archiveDate: "");
//     try {
//       v = MailClass(
//         // id: json["id"],
//         subject: json["subject"],
//         // description: json["description"],
//         // senderId: json["sender_id"],
//         archiveNumber: json["archive_number"],
//         archiveDate: json["archive_date"],
//         // decision: json["decision"],
//         // statusId: int.parse(json["status_id"]),
//         // finalDecision: json["final_decision"],
//         // createdAt: json["created_at"],
//         // updatedAt: json["updated_at"],
//         // sender: json["sender"] == null
//         //     ? Sender()
//         //     : Sender.fromJson(jsonDecode(json["sender"])),
//         // status: json["status"] == null
//         //     ? StatusElement()
//         //     : StatusElement.fromJson(jsonDecode(json["status"])),
//         // attachments: jsonDecode(json["attachments"])
//         //     .map<Attachment>(
//         //         (attachmentJson) => Attachment.fromJson(attachmentJson))
//         //     .toList(),
//         activities: jsonDecode(json["activities"])
//             .map<Activity>((activityJson) => Activity.fromJson(activityJson))
//             .toList(),
//         tags: jsonDecode(json["tags"]),
//       );
//     } catch (e) {
//       print("%%%%%%%%%%%%%%");
//       print(e);
//       print("%%%%%%%%%%%%%%");
//     }
//     return v;
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id.toString() ?? "",
//         "subject": subject,
//         "description": description ?? "",
//         "sender_id": senderId ?? "1",
//         "archive_number": archiveNumber,
//         "archive_date": archiveDate,
//         "decision": decision ?? "",
//         "status_id": statusId.toString() ?? "1",
//         "final_decision": finalDecision ?? "",
//         "created_at": createdAt ?? "",
//         "updated_at": updatedAt ?? "",
//         "sender": sender == null
//             ? json.encode(Sender())
//             : json.encode(sender?.toJson()),
//         "status": status == null
//             ? json.encode(StatusElement())
//             : json.encode(status?.toJson()),
//         "attachments": attachments == null
//             ? json.encode([])
//             : json.encode(List<Attachment>.from(attachments!.map((x) => x))),
//         "activities": activities == null
//             ? json.encode([])
//             : json.encode(List<Activity>.from(activities!.map((x) => x))),
//         "tags": tags == null ? [] : json.encode(tags),
//       };
// }

import 'dart:convert';

// import 'package:gsg_final_project_rgs/models/sender.dart';
// import 'package:gsg_final_project_rgs/models/status.dart';
// import 'package:gsg_final_project_rgs/models/tag.dart';

// import 'activity.dart';

// MailClass mailClassFromJson(String str) => MailClass.fromJson(json.decode(str));

// String mailClassToJson(MailClass data) => json.encode(data.toJson());

// class MailClass {
//   int? id;
//   String? subject;
//   String? description;
//   String? senderId;
//   String? archiveNumber;
//   String? archiveDate;
//   String? decision;
//   String? statusId;
//   dynamic finalDecision;
//   String? createdAt;
//   String? updatedAt;
//   Sender? sender;
//   StatusElement? status;
//   List<dynamic>? attachments;
//   List<Activity>? activities;
//   List<Tag>? tags;

//   MailClass({
//     this.id,
//     this.subject,
//     this.description,
//     this.senderId,
//     this.archiveNumber,
//     this.archiveDate,
//     this.decision,
//     this.statusId,
//     this.finalDecision,
//     this.createdAt,
//     this.updatedAt,
//     this.sender,
//     this.status,
//     this.attachments,
//     this.activities,
//     this.tags,
//   });

//   factory MailClass.fromJson(Map<String, dynamic> json) => MailClass(
//         id: json["id"],
//         subject: json["subject"],
//         description: json["description"],
//         senderId: json["sender_id"],
//         archiveNumber: json["archive_number"],
//         archiveDate: json["archive_date"],
//         decision: json["decision"],
//         statusId: json["status_id"],
//         finalDecision: json["final_decision"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         sender: json["sender"] == null
//             ? Sender()
//             : Sender.fromJson(jsonDecode(json["sender"])),
//         status: json["status"] == null
//             ? null
//             : StatusElement.fromJson(json["status"]),
//         attachments: json["attachments"] == null
//             ? []
//             : List<dynamic>.from(json["attachments"]!.map((x) => x)),
//         activities: json["activities"] == null
//             ? []
//             : List<Activity>.from(
//                 json["activities"]!.map((x) => Activity.fromJson(x))),
//         tags: json["tags"] == null
//             ? []
//             : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "subject": subject,
//         "description": description,
//         "sender_id": senderId,
//         "archive_number": archiveNumber,
//         "archive_date": archiveDate,
//         "decision": decision,
//         "status_id": statusId,
//         "final_decision": finalDecision,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "sender": sender?.toJson(),
//         "status": status?.toJson(),
//         "attachments": attachments == null
//             ? []
//             : List<dynamic>.from(attachments!.map((x) => x)),
//         "activities": activities == null
//             ? []
//             : List<dynamic>.from(activities!.map((x) => x.toJson())),
//         "tags": tags == null
//             ? []
//             : List<dynamic>.from(tags!.map((x) => x.toJson())),
//       };
// }
import 'dart:convert';

import 'package:gsg_final_project_rgs/models/activity.dart';
import 'package:gsg_final_project_rgs/models/attachment.dart';
import 'package:gsg_final_project_rgs/models/pivot.dart';
import 'package:gsg_final_project_rgs/models/sender.dart';
import 'package:gsg_final_project_rgs/models/status.dart';

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

MailClass mailClassFromJson(String str) => MailClass.fromJson(json.decode(str));

String mailClassToJson(MailClass data) => json.encode(data.toJson());

class MailClass {
  int? id;
  String subject;
  String? description;
  String? senderId;
  String archiveNumber;
  String archiveDate;
  String? decision;
  int? statusId;
  String? finalDecision;
  String? createdAt;
  String? updatedAt;
  Sender? sender;
  StatusElement? status; //status
  List<Attachment>? attachments;
  List<Activity>? activities;
  List<dynamic>? tags;

  MailClass({
    this.id,
    required this.subject,
    this.description,
    this.senderId,
    required this.archiveNumber,
    required this.archiveDate,
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

  factory MailClass.fromJson(Map<String, dynamic> json) {
    MailClass v = MailClass(subject: "", archiveNumber: "", archiveDate: "");
    try {
      v = MailClass(
        id: json["id"],
        subject: json["subject"],
        description: json["description"],
        senderId: json["sender_id"],
        archiveNumber: json["archive_number"],
        archiveDate: json["archive_date"],
        decision: json["decision"],
        statusId: int.parse(json["status_id"]),
        finalDecision: json["final_decision"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        sender: json["sender"] == null
            ? Sender()
            : Sender.fromJson(jsonDecode(json["sender"])),
        status: json["status"] == null
            ? StatusElement()
            : StatusElement.fromJson(jsonDecode(json["status"])),
        attachments: jsonDecode(json["attachments"])
            .map<Attachment>(
                (attachmentJson) => Attachment.fromJson(attachmentJson))
            .toList(),
        activities: jsonDecode(json["activities"])
            .map<Activity>((activityJson) => Activity.fromJson(activityJson))
            .toList(),
        tags: jsonDecode(json["tags"]),
      );
    } catch (e) {
      print("%%%%%%%%%%%%%%");
      print(e);
      print("%%%%%%%%%%%%%%");
    }
    return v;
  }

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "subject": subject,
        "description": description ?? "",
        "sender_id": senderId ?? "1",
        "archive_number": archiveNumber,
        "archive_date": archiveDate,
        "decision": decision ?? "",
        "status_id": statusId.toString() ?? "1",
        "final_decision": finalDecision ?? "",
        "created_at": createdAt ?? "",
        "updated_at": updatedAt ?? "",
        "sender": sender == null
            ? json.encode(Sender())
            : json.encode(sender?.toJson()),
        "status": status == null
            ? json.encode(StatusElement())
            : json.encode(status?.toJson()),
        "attachments": attachments == null
            ? json.encode([])
            : json.encode(List<Attachment>.from(attachments!.map((x) => x))),
        "activities": activities == null
            ? json.encode([])
            : json.encode(List<Activity>.from(activities!.map((x) => x))),
        "tags": tags == null ? [] : json.encode(tags),
      };
}
