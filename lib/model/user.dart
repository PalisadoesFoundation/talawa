// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:talawa/model/joinedorganization.dart';

List<User> userFromJson(String str) => List<User>.from(json
    .decode(str)
    .map((x) => User.fromJson(x as Map<String, dynamic>)) as Iterable);

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.image,
    this.joinedOrganizations,
    this.createdOrganizations,
    this.adminFor,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] as String,
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
        email: json["email"] as String,
        image: json["image"] as String,
        joinedOrganizations: List<JoinedOrganization>.from(
            json["joinedOrganizations"].map((x) =>
                    JoinedOrganization.fromJson(x as Map<String, dynamic>))
                as Iterable),
        createdOrganizations: List<CreatedOrganization>.from(
            json["createdOrganizations"].map((x) =>
                    CreatedOrganization.fromJson(x as Map<String, dynamic>))
                as Iterable),
        adminFor: List<AdminFor>.from(json["adminFor"]
                .map((x) => AdminFor.fromJson(x as Map<String, dynamic>))
            as Iterable),
      );

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final dynamic image;
  final List<JoinedOrganization> joinedOrganizations;
  final List<CreatedOrganization> createdOrganizations;
  final List<AdminFor> adminFor;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "image": image,
        "joinedOrganizations":
            List<dynamic>.from(joinedOrganizations.map((x) => x.toJson())),
        "createdOrganizations":
            List<dynamic>.from(createdOrganizations.map((x) => x.toJson())),
        "adminFor": List<dynamic>.from(adminFor.map((x) => x.toJson())),
      };
}
