import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/org_info.dart';

part 'user_info.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  User(
      {this.adminFor,
      this.createdOrganizations,
      this.email,
      this.firstName,
      required this.id,
      this.image,
      this.joinedOrganizations,
      this.lastName,
      this.authToken,
      this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json, {bool fromOrg = false}) {
    if (fromOrg) {
      return User(
        authToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        image: json['image'] as String?,
        adminFor: (json['adminFor'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
            .toList(),
        createdOrganizations: (json['createdOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
            .toList(),
        joinedOrganizations: (json['joinedOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
            .toList(),
      );
    }
    return User(
      authToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      id: json['user']['_id'] as String?,
      firstName: json['user']['firstName'] as String?,
      lastName: json['user']['lastName'] as String?,
      email: json['user']['email'] as String?,
      image: json['user']['image'] as String?,
      adminFor: (json['user']['adminFor'] as List<dynamic>?)
          ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
          .toList(),
      createdOrganizations:
          (json['user']['createdOrganizations'] as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
              .toList(),
      joinedOrganizations:
          (json['user']['joinedOrganizations'] as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
              .toList(),
    );
  }

  print() {
    debugPrint('authToken: ${this.authToken}');
    debugPrint('refreshToken: ${this.refreshToken}');
    debugPrint('_id: ${this.id}');
    debugPrint('firstName: ${this.firstName}');
    debugPrint('lastName: ${this.lastName}');
    debugPrint('image: ${this.image}');
    debugPrint('email: ${this.email}');
    debugPrint('joinedOrganizations: ${this.joinedOrganizations}');
    debugPrint('adminFor: ${this.adminFor}');
    debugPrint('createdOrganizations: ${this.createdOrganizations}');
    debugPrint('membershipRequests: ${this.membershipRequests}');
  }

  @HiveField(0)
  String? authToken;
  @HiveField(1)
  String? refreshToken;
  @HiveField(2)
  String? id;
  @HiveField(3)
  String? firstName;
  @HiveField(4)
  String? lastName;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? image;
  @HiveField(7)
  List<OrgInfo>? joinedOrganizations = [];
  @HiveField(8)
  List<OrgInfo>? createdOrganizations = [];
  @HiveField(9)
  List<OrgInfo>? adminFor = [];
  @HiveField(10)
  List<OrgInfo>? membershipRequests = [];

  updateJoinedOrg(List<OrgInfo> orgList) {
    this.joinedOrganizations!.addAll(orgList);
  }

  updateCreatedOrg(List<OrgInfo> orgList) {
    this.createdOrganizations!.addAll(orgList);
  }

  updateMemberRequestOrg(List<OrgInfo> orgList) {
    this.membershipRequests!.addAll(orgList);
  }

  updateAdminFor(List<OrgInfo> orgList) {
    this.adminFor!.addAll(orgList);
  }

  update(User details) {
    this.firstName = details.firstName;
    this.lastName = details.firstName;
    this.email = details.firstName;
    this.image = details.firstName;
    this.authToken = details.authToken;
    this.refreshToken = details.refreshToken;
    this.joinedOrganizations = details.joinedOrganizations;
    this.createdOrganizations = details.createdOrganizations;
    this.membershipRequests = details.membershipRequests;
    this.adminFor = details.adminFor;
  }
}
