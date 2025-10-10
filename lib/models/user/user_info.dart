// ignore_for_file: use_setters_to_change_properties

import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';

part 'user_info.g.dart';

@HiveType(typeId: 1)

/// This class creates a User model and returns a user instance.
class User extends HiveObject {
  User({
    this.email,
    this.name,
    this.id,
    this.image,
    this.joinedOrganizations,
    this.authToken,
    this.refreshToken,
    this.membershipRequests,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userData =
        json['user'] != null ? json['user'] as Map<String, dynamic> : json;

    final Map<String, dynamic>? org =
        userData['organizationsWhereMember'] as Map<String, dynamic>?;
    final List<dynamic>? edges = org?['edges'] as List<dynamic>?;
    final List<Map<String, dynamic>>? orgList =
        edges?.map((e) => e as Map<String, dynamic>).toList();
    return User(
      authToken: json['authenticationToken'] != null
          ? json['authenticationToken'] as String?
          : null,
      id: userData['id'] as String?,
      name: userData['name'] != null ? userData['name'] as String? : null,
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

  /// Method to updated joinedOrganisation list.
  ///
  /// **params**:
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
  }

  /// Method to update membershipRequests List.
  ///
  /// **params**:
  /// * `orgList`: List of organisations user have sent membership request.
  ///
  /// **returns**:
  ///   None
  void updateMemberRequestOrg(List<String> orgList) {
    this.membershipRequests = [...membershipRequests!, ...orgList];
  }

  /// Method to update the user details.
  ///
  /// **params**:
  /// * `details`: updated user Info/details
  ///
  /// **returns**:
  ///   None
  void update(User details) {
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
}
