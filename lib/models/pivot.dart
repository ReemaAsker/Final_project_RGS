// class Pivot {
//   String? mailId;
//   String? tagId;

//   Pivot({this.mailId, this.tagId});

//   Pivot.fromJson(Map<String, dynamic> json) {
//     mailId = json['mail_id'];
//     tagId = json['tag_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mail_id'] = this.mailId;
//     data['tag_id'] = this.tagId;
//     return data;
//   }
// }
//////////////////////////////

class Pivot {
  String? mailId;
  String? tagId;

  Pivot({
    this.mailId,
    this.tagId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        mailId: json["mail_id"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toJson() => {
        "mail_id": mailId,
        "tag_id": tagId,
      };
}
