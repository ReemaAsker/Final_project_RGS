// class Status {
//   int? id;
//   String? name;
//   String? color;

//   Status({this.id, this.name, this.color});

//   Status.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     color = json['color'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['color'] = this.color;
//     return data;
//   }
// }
///////////////////////////////////////////////

class Status {
  int? id;
  String? name;
  String? color;
  String? createdAt;
  String? updatedAt;

  Status({
    this.id,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
