// To parse this JSON data, do
//
//     final switchOrg = switchOrgFromJson(jsonString);

import 'dart:convert';

SwitchOrg switchOrgFromJson(String str) =>
    SwitchOrg.fromJson(json.decode(str) as Map<String, dynamic>);

String switchOrgToJson(SwitchOrg data) => json.encode(data.toJson());

class SwitchOrg {
  SwitchOrg({
    this.data,
  });

  factory SwitchOrg.fromJson(Map<String, dynamic> json) => SwitchOrg(
        data: Data.fromJson(json["data"] as Map<String, dynamic>),
      );

  Data data;

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.users,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: List<User>.from((json["users"] as List)
            .map((x) => User.fromJson(x as Map<String, dynamic>))),
      );

  List<User> users;

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.joinedOrganizations,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        joinedOrganizations: List<JoinedOrganization>.from(
            (json["joinedOrganizations"] as List).map(
                (x) => JoinedOrganization.fromJson(x as Map<String, dynamic>))),
      );

  List<JoinedOrganization> joinedOrganizations;

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

  factory JoinedOrganization.fromJson(Map<String, dynamic> json) =>
      JoinedOrganization(
        image: json["image"].toString(),
        id: json["_id"].toString(),
        name: json["name"].toString(),
        description: json["description"].toString(),
        creator: Creator.fromJson(json["creator"] as Map<String, dynamic>),
      );

  String image;
  String id;
  String name;
  String description;
  Creator creator;

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

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        firstName: json["firstName"].toString(),
        lastName: json["lastName"].toString(),
      );

  String firstName;
  String lastName;

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}
