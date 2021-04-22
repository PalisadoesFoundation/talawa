// To parse this JSON data, do
//
//     final switchOrg = switchOrgFromJson(jsonString);

import 'dart:convert';

SwitchOrg switchOrgFromJson(String str) => SwitchOrg.fromJson(json.decode(str));

String switchOrgToJson(SwitchOrg data) => json.encode(data.toJson());

class SwitchOrg {
  SwitchOrg({
    this.data,
  });

  Data data;

  factory SwitchOrg.fromJson(Map<String, dynamic> json) => SwitchOrg(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.users,
  });

  List<User> users;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.joinedOrganizations,
  });

  List<JoinedOrganization> joinedOrganizations;

  factory User.fromJson(Map<String, dynamic> json) => User(
        joinedOrganizations: List<JoinedOrganization>.from(
            json["joinedOrganizations"]
                .map((x) => JoinedOrganization.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "joinedOrganizations":
            List<dynamic>.from(joinedOrganizations.map((x) => x.toJson())),
      };
}

class JoinedOrganization {
  JoinedOrganization({
    this.image,
    this.id,
    this.name,
    this.description,
    this.creator,
  });

  String image;
  String id;
  String name;
  String description;
  Creator creator;

  factory JoinedOrganization.fromJson(Map<String, dynamic> json) =>
      JoinedOrganization(
        image: json["image"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        creator: Creator.fromJson(json["creator"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "_id": id,
        "name": name,
        "description": description,
        "creator": creator.toJson(),
      };
}

class Creator {
  Creator({
    this.firstName,
    this.lastName,
  });

  String firstName;
  String lastName;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}
