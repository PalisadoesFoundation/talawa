// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';

part 'user_info.g.dart';

@HiveType(typeId: 1)

/// This class creates a User model and returns a user instance.
class User extends HiveObject {
  /// Constructs a `User` instance.
  ///
  /// [adminFor] is the list of organizations where the user has admin privileges.
  /// [createdOrganizations] is the list of organizations created by the user.
  /// [email] is the user's email address.
  /// [firstName] is the user's first name.
  /// [id] is the unique identifier of the user.
  /// [image] is the URL of the user's profile image/avatar.
  /// [joinedOrganizations] is the list of organizations the user has joined.
  /// [lastName] is the user's last name.
  /// [authToken] is the authentication token for API requests.
  /// [refreshToken] is the token used to refresh the authentication token.
  /// [membershipRequests] is the list of organizations where the user has sent membership requests.
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

  /// Creates a `User` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the user data.
  /// The [fromOrg] parameter indicates whether the data comes from organization query.
  ///
  /// **params**:
  /// * `json`: Map containing the user data from API response
  /// * `fromOrg`: Boolean flag indicating if data is from organization query
  ///
  /// **returns**:
  /// * `User`: An instance of User with populated data
  factory User.fromJson(Map<String, dynamic> json, {bool fromOrg = false}) {
    if (fromOrg) {
      // For usersByOrganizationId - direct user data from PostgreSQL
      final nameData = _parseFullName(json['name'] as String?);

      return User(
        id: json['id'] as String?,
        firstName: nameData['firstName'],
        lastName: nameData['lastName'],
        email: json['emailAddress'] as String?,
        image: json['avatarURL'] as String?,
        joinedOrganizations: [],
      );
    } else {
      // For signIn and other queries - nested user data
      final Map<String, dynamic> userData =
          json['user'] as Map<String, dynamic>;
      final nameData = _parseFullName(userData['name'] as String?);

      List<Map<String, dynamic>>? orgList;
      try {
        final Map<String, dynamic>? org =
            userData['organizationsWhereMember'] as Map<String, dynamic>?;
        final List<dynamic>? edges = org?['edges'] as List<dynamic>?;
        orgList = edges?.map((e) => e as Map<String, dynamic>).toList();
      } catch (e) {
        // Log error if needed, but continue with empty list
        orgList = null;
      }

      return User(
        authToken: json['authenticationToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        id: userData['id'] as String?,
        firstName: nameData['firstName'],
        lastName: nameData['lastName'],
        email: userData['emailAddress'] as String?,
        image: userData['avatarURL'] as String?,
        joinedOrganizations: orgList != null
            ? orgList
                .map((e) => OrgInfo.fromJson(e["node"] as Map<String, dynamic>))
                .toList()
            : [],
      );
    }
  }

  /// Helper method to parse full name into firstName and lastName.
  ///
  /// **params**:
  /// * `fullName`: The full name string to be parsed
  ///
  /// **returns**:
  /// * `Map<String, String?>`: A map containing 'firstName' and 'lastName' keys
  static Map<String, String?> _parseFullName(String? fullName) {
    final List<String>? nameParts = fullName?.split(' ');
    final String? firstName =
        nameParts != null && nameParts.isNotEmpty ? nameParts[0] : null;
    final String? lastName = nameParts != null && nameParts.length > 1
        ? nameParts.sublist(1).join(' ')
        : null;
    return {'firstName': firstName, 'lastName': lastName};
  }

  /// Computed property to get the full name of the user.
  String? get name {
    final hasFirstName = firstName != null && firstName!.isNotEmpty;
    final hasLastName = lastName != null && lastName!.isNotEmpty;

    if (hasFirstName && hasLastName) {
      return '$firstName $lastName';
    } else if (hasFirstName) {
      return firstName;
    } else if (hasLastName) {
      return lastName;
    }
    return null;
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
  }
}
