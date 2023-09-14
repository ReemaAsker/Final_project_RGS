import 'mail.dart';

class StatusResponse {
  List<Status>? statuses;

  StatusResponse({this.statuses});

  StatusResponse.fromJson(Map<String, dynamic> json) {
    if (json['statuses'] != null) {
      statuses = <Status>[];
      json['statuses'].forEach((v) {
        statuses!.add(new Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statuses != null) {
      data['statuses'] = this.statuses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  int? id;
  String? name;
  String? color;
  String? createdAt;
  String? updatedAt;
  String? mailsCount;
  List<MailClass>? mails;

  Status(
      {this.id,
      this.name,
      this.color,
      this.createdAt,
      this.updatedAt,
      this.mailsCount,
      this.mails});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mailsCount = json['mails_count'];
    if (json['mails'] != null) {
      mails = <MailClass>[];
      json['mails'].forEach((v) {
        mails!.add(new MailClass.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mails_count'] = this.mailsCount;
    if (this.mails != null) {
      data['mails'] = this.mails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
