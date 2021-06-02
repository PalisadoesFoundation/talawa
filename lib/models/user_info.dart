import 'package:flutter/material.dart';
import 'package:talawa/models/org_info.dart';

class User {
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

  factory User.fromJson(Map<String, dynamic> json, String from) {
    return User(
      authToken: json[from]['accessToken'] as String,
      refreshToken: json[from]['refreshToken'] as String,
      id: json[from]['user']['_id'] as String,
      firstName: json[from]['user']['firstName'] as String,
      lastName: json[from]['user']['lastName'] as String,
      email: json[from]['user']['email'] as String,
      image: json[from]['user']['image'] as String?,
      adminFor: (json[from]['user']['adminFor'] as List<dynamic>?)
          ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
          .toList(),
      createdOrganizations:
          (json[from]['user']['createdOrganizations'] as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, OrgInfo>))
              .toList(),
      joinedOrganizations:
          (json[from]['user']['joinedOrganizations'] as List<dynamic>?)
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

  String? authToken;
  String? refreshToken;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  List<OrgInfo>? joinedOrganizations;
  List<OrgInfo>? createdOrganizations;
  List<OrgInfo>? adminFor;
  List<OrgInfo>? membershipRequests;

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
