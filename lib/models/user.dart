// import 'dart:convert';
//
// import 'package:gsg_final_project_rgs/models/role.dart';
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? image;
//   dynamic emailVerifiedAt;
//   String? roleId;
//   String? createdAt;
//   String? updatedAt;
//   Role? role;
//
//   User({
//     this.id,
//     this.name,
//     this.email,
//     this.image,
//     this.emailVerifiedAt,
//     this.roleId,
//     this.createdAt,
//     this.updatedAt,
//     this.role,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         image: json["image"],
//         emailVerifiedAt: json["email_verified_at"],
//         roleId: json["role_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         role: json["role"] == null ? null : Role.fromJson(json["role"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "image": image,
//         "email_verified_at": emailVerifiedAt,
//         "role_id": roleId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "role": role?.toJson(),
//       };
// }
//
// // class User {
// //   int? _id;
// //   String? _name;
// //   String? _email;
// //   String? _image;
// //   dynamic _emailVerifiedAt;
// //   String? _roleId;
// //   dynamic _createdAt;
// //   String? _updatedAt;
// //   Role? _role;
// //
// //   User(
// //       {int? id,
// //       String? name,
// //       String? email,
// //       String? image,
// //       Null? emailVerifiedAt,
// //       String? roleId,
// //       Null? createdAt,
// //       String? updatedAt,
// //       Role? role}) {
// //     if (id != null) {
// //       this._id = id;
// //     }
// //     if (name != null) {
// //       this._name = name;
// //     }
// //     if (email != null) {
// //       this._email = email;
// //     }
// //     if (image != null) {
// //       this._image = image;
// //     }
// //     if (emailVerifiedAt != null) {
// //       this._emailVerifiedAt = emailVerifiedAt;
// //     }
// //     if (roleId != null) {
// //       this._roleId = roleId;
// //     }
// //     if (createdAt != null) {
// //       this._createdAt = createdAt;
// //     }
// //     if (updatedAt != null) {
// //       this._updatedAt = updatedAt;
// //     }
// //     if (role != null) {
// //       this._role = role;
// //     }
// //   }
// //
// //   int? get id => _id;
// //   set id(int? id) => _id = id;
// //   String? get name => _name;
// //   set name(String? name) => _name = name;
// //   String? get email => _email;
// //   set email(String? email) => _email = email;
// //   String? get image => _image;
// //   set image(String? image) => _image = image;
// //   Null? get emailVerifiedAt => _emailVerifiedAt;
// //   set emailVerifiedAt(Null? emailVerifiedAt) =>
// //       _emailVerifiedAt = emailVerifiedAt;
// //   String? get roleId => _roleId;
// //   set roleId(String? roleId) => _roleId = roleId;
// //   Null? get createdAt => _createdAt;
// //   set createdAt(Null? createdAt) => _createdAt = createdAt;
// //   String? get updatedAt => _updatedAt;
// //   set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
// //   Role? get role => _role;
// //   set role(Role? role) => _role = role;
// //
// //   User.fromJson(Map<String, dynamic> json) {
// //     _id = json['id'];
// //     _name = json['name'];
// //     _email = json['email'];
// //     _image = json['image'];
// //     _emailVerifiedAt = json['email_verified_at'];
// //     _roleId = json['role_id'];
// //     _createdAt = json['created_at'];
// //     _updatedAt = json['updated_at'];
// //     _role = json['role'] != null ? new Role.fromJson(json['role']) : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this._id;
// //     data['name'] = this._name;
// //     data['email'] = this._email;
// //     data['image'] = this._image;
// //     data['email_verified_at'] = this._emailVerifiedAt;
// //     data['role_id'] = this._roleId;
// //     data['created_at'] = this._createdAt;
// //     data['updated_at'] = this._updatedAt;
// //     if (this._role != null) {
// //       data['role'] = this._role!.toJson();
// //     }
// //     return data;
// //   }
// // }
