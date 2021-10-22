/// importing packages and files
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';

/// user_info.g.dart' will be split and its private members 
/// are accessible for all code within the files 
part 'user_info.g.dart';

/// HiveType can be used to keep track of old field Ids which must not be reused.
@HiveType(typeId: 1)

/// The user class extends HiveObject
class User extends HiveObject {
  User(
      {this.adminFor,
      this.createdOrganizations,
      this.email,
      this.firstName,
      this.id,
      this.image,
      this.joinedOrganizations,
      this.lastName,
      this.authToken,
      this.refreshToken,
      this.membershipRequests});

  /// Returns an instance of an user
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
                ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>,
                    memberRequest: true))
                .toList()
            : null);
  }

  /// Output User Details
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
  
  /// Update the list of organizations joined by the user
  updateJoinedOrg(List<OrgInfo> orgList) {
    this.joinedOrganizations = orgList;
  }
  /// update the list of organizations created by the user
  updateCreatedOrg(List<OrgInfo> orgList) {
    this.createdOrganizations = orgList;
  }

  /// update the list of membership requests for an organizations
  updateMemberRequestOrg(List<OrgInfo> orgList) {
    this.membershipRequests = [...membershipRequests!, ...orgList];
  }
  
  /// update admin for the orgnaization
  updateAdminFor(List<OrgInfo> orgList) {
    this.adminFor = orgList;
  }

  /// Update user details
  update(User details) {

    /// errors in the lines below check to see if the attributes are assigned correctly
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