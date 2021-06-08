import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';

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
      this.refreshToken,
      this.membershipRequests});

  factory User.fromJson(Map<String, dynamic> json1, {bool fromOrg = false}) {
    Map<String, dynamic> json;
    if (fromOrg) {
      json = json1;
    } else {
      json = json1['user'] as Map<String, dynamic>;
    }
    return User(
        authToken: fromOrg ? ' ' : json1['accessToken'] as String?,
        refreshToken: fromOrg ? ' ' : json1['refreshToken'] as String?,
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        image: json['image'] as String?,
        adminFor: (json['adminFor'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdOrganizations: (json['createdOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        joinedOrganizations: (json['joinedOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        membershipRequests: (json['membershipRequests'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>,
                memberRequest: true))
            .toList());
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
    this.joinedOrganizations = orgList;
  }

  updateCreatedOrg(List<OrgInfo> orgList) {
    this.createdOrganizations = orgList;
  }

  updateMemberRequestOrg(List<OrgInfo> orgList) {
    this.membershipRequests = orgList;
  }

  updateAdminFor(List<OrgInfo> orgList) {
    this.adminFor = orgList;
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
