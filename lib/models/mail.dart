import 'package:gsg_final_project_rgs/models/activity.dart';
import 'package:gsg_final_project_rgs/models/attachment.dart';
import 'package:gsg_final_project_rgs/models/sender.dart';
import 'package:gsg_final_project_rgs/models/status.dart';
import 'package:gsg_final_project_rgs/models/tag.dart';

class Mail {
  int? id;
  String? subject;
  String? description;
  String? senderId;
  String? archiveNumber;
  String? archiveDate;
  String? decision;
  String? statusId;
  dynamic finalDecision;
  String? createdAt;
  String? updatedAt;
  Sender? sender;
  Status? status;
  List<Tag>? tags;
  List<Attachment>? attachments;
  List<Activitie>? activities;

  Mail(
      {this.id,
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
      this.tags,
      this.attachments,
      this.activities});

  Mail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    senderId = json['sender_id'];
    archiveNumber = json['archive_number'];
    archiveDate = json['archive_date'];
    decision = json['decision'];
    statusId = json['status_id'];
    finalDecision = json['final_decision'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['tags'] != null) {
      tags = <Tag>[];
      json['tags'].forEach((v) {
        tags!.add(new Tag.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = <Attachment>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachment.fromJson(v));
      });
    }
    if (json['activities'] != null) {
      activities = <Activitie>[];
      json['activities'].forEach((v) {
        activities!.add(new Activitie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['description'] = this.description;
    data['sender_id'] = this.senderId;
    data['archive_number'] = this.archiveNumber;
    data['archive_date'] = this.archiveDate;
    data['decision'] = this.decision;
    data['status_id'] = this.statusId;
    data['final_decision'] = this.finalDecision;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
