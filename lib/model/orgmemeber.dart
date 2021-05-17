// To parse this JSON data, do
//
//     final orgMembers = orgMembersFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

OrgMembers orgMembersFromJson(String str) =>
    OrgMembers.fromJson(json.decode(str) as Map<String, dynamic>);

String orgMembersToJson(OrgMembers data) => json.encode(data.toJson());

class OrgMembers {
  OrgMembers({
    @required this.id,
    this.image,
    this.name,
    this.admins,
    this.description,
    this.isPublic,
    this.creator,
    this.members,
  });
  factory OrgMembers.fromJson(Map<String, dynamic> json) => OrgMembers(
        image: json["image"] as String,
        id: json["_id"] as String,
        name: json["name"] as String,
        admins: List<Admin>.from(json["admins"]
            .map((x) => Admin.fromJson(x as Map<String, dynamic>)) as Iterable),
        description: json["description"] as String,
        isPublic: json["isPublic"] as bool,
        creator: Creator.fromJson(json["creator"] as Map<String, dynamic>),
        members: List<Member>.from(json["members"]
                .map((x) => Member.fromJson(x as Map<String, dynamic>))
            as Iterable),
      );

  String image;
  String id;
  String name;
  List<Admin> admins;
  String description;
  bool isPublic;
  Creator creator;
  List<Member> members;

  Map<String, dynamic> toJson() => {
        "image": image,
        "_id": id,
        "name": name,
        "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
        "description": description,
        "isPublic": isPublic,
        "creator": creator.toJson(),
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class Admin {
  Admin({
    @required this.id,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["_id"] as String,
      );

  String id;

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}

class Creator {
  Creator({
    @required this.id,
    this.firstName,
    this.lastName,
  });
  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["_id"] as String,
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
      );

  String id;
  String firstName;
  String lastName;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class Member {
  Member({
    @required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.image,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["_id"] as String,
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
        email: json["email"] as String,
        image: json["image"] as String,
      );

  String id;
  String firstName;
  String lastName;
  String email;
  String image;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "image": image,
      };
}
