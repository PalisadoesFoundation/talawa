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
    this.isSuperAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json1, {bool fromOrg = false}) {
    Map<String, dynamic> json;
    Map<String, dynamic>? appUserProfile;
    if (fromOrg) {
      json = json1;
    } else {
      json = json1['user'] as Map<String, dynamic>;
      appUserProfile = json1['appUserProfile'] as Map<String, dynamic>?;
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
      adminFor: appUserProfile?['adminFor'] != null
          ? (appUserProfile!['adminFor'] as List<dynamic>)
              .map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      createdOrganizations: appUserProfile?['createdOrganizations'] != null
          ? (appUserProfile!['createdOrganizations'] as List<dynamic>)
              .map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      joinedOrganizations: json['joinedOrganizations'] != null
          ? (json['joinedOrganizations'] as List<dynamic>)
              .map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      membershipRequests: json['membershipRequests'] != null
          ? (json['membershipRequests'] as List<dynamic>)
              .map(
                (e) => OrgInfo.fromJson(
                  e as Map<String, dynamic>,
                  memberRequest: true,
                ),
              )
              .toList()
          : null,
      isSuperAdmin: appUserProfile?['isSuperAdmin'] != null
          ? appUserProfile!['isSuperAdmin'] as bool?
          : null,
    );
  }

  /// Method to print the User details.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
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
    debugPrint('isSuperAdmin: ${this.isSuperAdmin}');
  }

  /// HiveField for authToken.
  @HiveField(0)
  String? authToken;

  /// HiveField for refreshToken.
  @HiveField(1)
  String? refreshToken;

  /// HiveField for userID.
  @HiveField(2)
  String? id;

  /// HiveField for user's first name.
  @HiveField(3)
  String? firstName;

  /// HiveField for user's last name.
  @HiveField(4)
  String? lastName;

  /// HiveField for user's Email.
  @HiveField(5)
  String? email;

  /// HiveField for user's avatar.
  @HiveField(6)
  String? image;

  /// /// HiveField for all organisations joined by user.
  @HiveField(7)
  List<OrgInfo>? joinedOrganizations = [];

  /// HiveField for all organisations created by user.
  @HiveField(8)
  List<OrgInfo>? createdOrganizations = [];

  /// HiveField for all organisations user is admin of.
  @HiveField(9)
  List<OrgInfo>? adminFor = [];

  /// HiveField for all organisations user has sent membership request.
  @HiveField(10)
  List<OrgInfo>? membershipRequests = [];

  /// HiveField to determine if user is super admin.
  @HiveField(11)
  bool? isSuperAdmin;

  /// Method to updated joinedOrganisation list.
  ///
  /// **params**:
  /// * `orgList`: List of organsaitions user has joined.
  ///
  /// **returns**:
  ///   None
  void updateJoinedOrg(List<OrgInfo> orgList) {
    this.joinedOrganizations = orgList;
  }

  /// Method to updated createdOrganisation list.
  ///
  /// **params**:
  /// * `orgList`: List of organsaitions user has created.
  ///
  /// **returns**:
  ///   None
  void updateCreatedOrg(List<OrgInfo> orgList) {
    this.createdOrganizations = orgList;
  }

  /// Method to update membershipRequests List.
  ///
  /// **params**:
  /// * `orgList`: List of organisations user have sent membership request.
  ///
  /// **returns**:
  ///   None
  void updateMemberRequestOrg(List<OrgInfo> orgList) {
    this.membershipRequests = [...membershipRequests!, ...orgList];
  }

  /// Method to update adminFor List.
  ///
  /// **params**:
  /// * `orgList`: List of organisations user is admin of.
  ///
  /// **returns**:
  ///   None
  void updateAdminFor(List<OrgInfo> orgList) {
    this.adminFor = orgList;
  }

  /// Method to update the user details.
  ///
  /// **params**:
  /// * `details`: updated user Info/details
  ///
  /// **returns**:
  ///   None
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
    this.isSuperAdmin = details.isSuperAdmin;
  }
}
