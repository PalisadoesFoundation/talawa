// ignore_for_file: talawa_api_doc, use_setters_to_change_properties
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';

part 'user_info.g.dart';

@HiveType(typeId: 1)

/// This class creates a User model and returns a user instance.
class User extends HiveObject {
  User({
    this.adminFor,
    this.createdOrganizations,
    this.email,
    this.firstName,
    this.id,
    this.image,
    this.joinedOrganizations,
    this.lastName,
    this.authToken,
    this.refreshToken,
    this.membershipRequests,
  });

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
      firstName:
          json['firstName'] != null ? json['firstName'] as String? : null,
      lastName: json['lastName'] != null ? json['lastName'] as String? : null,
      email: json['email'] != null ? json['email'] as String? : null,
      image: json['image'] != null ? json['image'] as String? : null,
      adminFor: json['adminFor'] != null
          ? (json['adminFor'] as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      createdOrganizations: json['createdOrganizations'] != null
          ? (json['createdOrganizations'] as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      joinedOrganizations: json['joinedOrganizations'] != null
          ? (json['joinedOrganizations'] as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      membershipRequests: json['membershipRequests'] != null
          ? (json['membershipRequests'] as List<dynamic>?)
              ?.map(
                (e) => OrgInfo.fromJson(
                  e as Map<String, dynamic>,
                  memberRequest: true,
                ),
              )
              .toList()
          : null,
    );
  }
  //Method to print the User details.
  void print() {
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

  void updateJoinedOrg(List<OrgInfo> orgList) {
    this.joinedOrganizations = orgList;
  }

  void updateCreatedOrg(List<OrgInfo> orgList) {
    this.createdOrganizations = orgList;
  }

  void updateMemberRequestOrg(List<OrgInfo> orgList) {
    this.membershipRequests = [...membershipRequests!, ...orgList];
  }

  void updateAdminFor(List<OrgInfo> orgList) {
    this.adminFor = orgList;
  }

  //Method to update the user details.
  void update(User details) {
    this.firstName = details.firstName;
    this.lastName = details.lastName;
    this.email = details.email;
    this.image = details.image;
    this.authToken = details.authToken;
    this.refreshToken = details.refreshToken;
    this.joinedOrganizations = details.joinedOrganizations;
    this.createdOrganizations = details.createdOrganizations;
    this.membershipRequests = details.membershipRequests;
    this.adminFor = details.adminFor;
  }
}
