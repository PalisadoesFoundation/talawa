// ignore_for_file: use_setters_to_change_properties

<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
>>>>>>> upstream/develop
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';

part 'user_info.g.dart';

@HiveType(typeId: 1)

/// This class creates a User model and returns a user instance.
class User extends HiveObject {
  User({
<<<<<<< HEAD
    this.adminFor,
    this.createdOrganizations,
    this.email,
    this.firstName,
    this.id,
    this.image,
    this.joinedOrganizations,
    this.lastName,
=======
    this.email,
    this.name,
    this.id,
    this.image,
    this.joinedOrganizations,
>>>>>>> upstream/develop
    this.authToken,
    this.refreshToken,
    this.membershipRequests,
  });

<<<<<<< HEAD
  factory User.fromJson(Map<String, dynamic> json, {bool fromOrg = false}) {
    final Map<String, dynamic> userData =
        json['user'] != null ? json['user'] as Map<String, dynamic> : {};
    final String? fullName = userData['name'] as String?;
    final List<String>? nameParts = fullName?.split(' ');
    final String? firstName =
        nameParts != null && nameParts.isNotEmpty ? nameParts[0] : null;
    final String? lastName = nameParts != null && nameParts.length > 1
        ? nameParts.sublist(1).join(' ')
        : null;
=======
  factory User.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userData =
        json['user'] != null ? json['user'] as Map<String, dynamic> : json;

>>>>>>> upstream/develop
    final Map<String, dynamic>? org =
        userData['organizationsWhereMember'] as Map<String, dynamic>?;
    final List<dynamic>? edges = org?['edges'] as List<dynamic>?;
    final List<Map<String, dynamic>>? orgList =
        edges?.map((e) => e as Map<String, dynamic>).toList();
    return User(
      authToken: json['authenticationToken'] != null
          ? json['authenticationToken'] as String?
          : null,
<<<<<<< HEAD
      refreshToken: fromOrg ? ' ' : json['refreshToken'] as String?,
      id: userData['id'] as String?,
      firstName: firstName,
      lastName: lastName,
=======
      id: userData['id'] as String?,
      name: userData['name'] != null ? userData['name'] as String? : null,
>>>>>>> upstream/develop
      email: userData['emailAddress'] != null
          ? userData['emailAddress'] as String?
          : null,
      image: userData['avatarURL'] != null
          ? userData['avatarURL'] as String?
          : null,
      joinedOrganizations: orgList != null
          ? orgList
              .map((e) => OrgInfo.fromJson(e["node"] as Map<String, dynamic>))
              .toList()
          : [],
<<<<<<< HEAD
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
=======
      membershipRequests: userData['orgIdWhereMembershipRequested'] != null
          ? List<String>.from(userData['orgIdWhereMembershipRequested'] as List)
          : [],
    );
  }

  /// First name of the user.
  String? get firstName {
    if (name != null) {
      return name!.split(' ').first;
    }
    return null;
  }

  /// Last name of the user.
  String? get lastName {
    if (name != null) {
      final parts = name!.split(' ');
      return parts.length > 1 ? parts.sublist(1).join(' ') : '';
    }
    return null;
>>>>>>> upstream/develop
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

<<<<<<< HEAD
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
=======
  /// HiveField for user's name.
  @HiveField(3)
  String? name;

  /// HiveField for user's Email.
  @HiveField(4)
  String? email;

  /// HiveField for user's avatar.
  @HiveField(5)
  String? image;

  /// /// HiveField for all organisations joined by user.
  @HiveField(6)
  List<OrgInfo>? joinedOrganizations = [];

  /// HiveField for all organisations user has sent membership request.
  @HiveField(10)
  List<String>? membershipRequests = [];
>>>>>>> upstream/develop

  /// Method to updated joinedOrganisation list.
  ///
  /// **params**:
<<<<<<< HEAD
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
=======
  /// * `org`: Organisation to be added to the joinedOrganizations list.
  ///
  /// **returns**:
  ///   None
  void updateJoinedOrg(OrgInfo org) {
    final existingOrgs = joinedOrganizations ?? [];
    // Remove any existing org with the same ID and add the new one
    this.joinedOrganizations = [
      org,
      ...existingOrgs.where((existingOrg) => existingOrg.id != org.id),
    ];
>>>>>>> upstream/develop
  }

  /// Method to update membershipRequests List.
  ///
  /// **params**:
  /// * `orgList`: List of organisations user have sent membership request.
  ///
  /// **returns**:
  ///   None
<<<<<<< HEAD
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

=======
  void updateMemberRequestOrg(List<String> orgList) {
    this.membershipRequests = [...membershipRequests!, ...orgList];
  }

>>>>>>> upstream/develop
  /// Method to update the user details.
  ///
  /// **params**:
  /// * `details`: updated user Info/details
  ///
  /// **returns**:
  ///   None
  void update(User details) {
<<<<<<< HEAD
    this.firstName = details.firstName;
    this.lastName = details.lastName;
    this.email = details.email;
    this.image = details.image;
    this.authToken = details.authToken;
    // this.refreshToken = details.refreshToken;
    // this.joinedOrganizations = details.joinedOrganizations;
    // this.createdOrganizations = details.createdOrganizations;
    // this.membershipRequests = details.membershipRequests;
    // this.adminFor = details.adminFor;
  }
=======
    this.name = details.name;
    this.email = details.email;
    this.image = details.image;
    this.authToken = details.authToken;
    this.refreshToken = details.refreshToken;
    this.joinedOrganizations = details.joinedOrganizations;
    this.membershipRequests = details.membershipRequests;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id?.hashCode ?? 0;
>>>>>>> upstream/develop
}
