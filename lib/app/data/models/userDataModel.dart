import 'dart:convert';

List<UserDataModel> userDataModelFromJson(String str) =>
    List<UserDataModel>.from(
        json.decode(str).map((x) => UserDataModel.fromJson(x)));

String userDataModelToJson(List<UserDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? avatar;
  String? domain;
  bool? available;

  UserDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.avatar,
    this.domain,
    this.available,
  });

  UserDataModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? avatar,
    String? domain,
    bool? available,
  }) =>
      UserDataModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        avatar: avatar ?? this.avatar,
        domain: domain ?? this.domain,
        available: available ?? this.available,
      );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        avatar: json["avatar"],
        domain: json["domain"],
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "avatar": avatar,
        "domain": domain,
        "available": available,
      };
}
