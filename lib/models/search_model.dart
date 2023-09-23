import 'dart:convert';

import 'mail.dart';

SearchResponseModel searchResponseModelFromJson(String str) =>
    SearchResponseModel.fromJson(json.decode(str));

String searchResponseModelToJson(SearchResponseModel data) =>
    json.encode(data.toJson());

class SearchResponseModel {
  List<MailClass>? mails;

  SearchResponseModel({
    this.mails,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
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
