import 'package:hive/hive.dart';
import 'package:talawa/models/user/user_info.dart';
<<<<<<< HEAD

=======
>>>>>>> upstream/develop
part 'org_info.g.dart';

/// This class creates an organization-information model and returns an OrgInfo instance.
@HiveType(typeId: 2)
class OrgInfo {
  /// Constructs an OrgInfo object.
  OrgInfo({
<<<<<<< HEAD
    this.admins,
    this.members,
=======
>>>>>>> upstream/develop
    this.description,
    this.id,
    this.image,
    this.userRegistrationRequired,
    this.name,
    this.city,
    this.countryCode,
    this.line1,
    this.line2,
    this.postalCode,
    this.state,
<<<<<<< HEAD
=======
    this.adminsCount,
    this.membersCount,
    this.members,
    this.admins,
>>>>>>> upstream/develop
  });

  /// Factory method to construct an OrgInfo from a JSON object.
  ///
  /// **params**:
  /// * `json1`: The JSON object containing the organization data.
  /// * `memberRequest`: A boolean flag to indicate if the request is from a member.
  ///
  /// **returns**:
  /// * `OrgInfo`: Returns an instance of OrgInfo containing the parsed data.
  factory OrgInfo.fromJson(Map<String, dynamic> json) {
    final membersJson = json['members'] as Map<String, dynamic>?;
    final List<dynamic> edgesDynamic =
        membersJson?['edges'] as List<dynamic>? ?? [];

    final List<Map<String, dynamic>> memberEdges =
        edgesDynamic.map((e) => e as Map<String, dynamic>).toList();
<<<<<<< HEAD

    final List<User> members = memberEdges
        .map(
          (e) =>
              User.fromJson(e['node'] as Map<String, dynamic>, fromOrg: true),
=======
    final List<User> members = memberEdges
        .map(
          (e) => User.fromJson(e['node'] as Map<String, dynamic>),
>>>>>>> upstream/develop
        )
        .toList();

    final List<User> admins = memberEdges
        .map((e) {
          final Map<String, dynamic> user = e['node'] as Map<String, dynamic>;
          if (user['role'] == 'administrator') {
<<<<<<< HEAD
            return User.fromJson(user, fromOrg: true);
=======
            return User.fromJson(user);
>>>>>>> upstream/develop
          }
          return null;
        })
        .where((user) => user != null)
        .cast<User>()
        .toList();
<<<<<<< HEAD

=======
>>>>>>> upstream/develop
    return OrgInfo(
      id: json['id'] != null ? json['id'] as String : null,
      image: json['avatarURL'] != null ? json['avatarURL'] as String? : null,
      name: json['name'] != null ? json['name'] as String? : null,
      description:
          json['description'] != null ? json['description'] as String? : null,
<<<<<<< HEAD
      userRegistrationRequired: json['userRegistrationRequired'] != null
          ? json['userRegistrationRequired'] as bool?
          : null,
      members: members,
      admins: admins,
=======
      userRegistrationRequired: json['isUserRegistrationRequired'] != null
          ? json['isUserRegistrationRequired'] as bool?
          : null,
>>>>>>> upstream/develop
      city: json['city'] as String?,
      countryCode: json['countryCode'] as String?,
      line1: json['addressLine1'] as String?,
      line2: json['addressLine2'] as String?,
      postalCode: json['postalCode'] as String?,
      state: json['state'] as String?,
<<<<<<< HEAD
=======
      members: members,
      admins: admins,
      adminsCount:
          json['adminsCount'] != null ? json['adminsCount'] as int? : null,
      membersCount:
          json['membersCount'] != null ? json['membersCount'] as int? : null,
>>>>>>> upstream/develop
    );
  }

  /// Converts a JSON array to a list of OrgInfo instances.
  ///
  /// **params**:
  /// * `json`: The JSON array to be parsed.
  ///
  /// **returns**:
  /// * `List<OrgInfo>`: A list of OrgInfo objects containing the parsed data.
  List<OrgInfo> fromJsonToList(dynamic json) {
    final List<OrgInfo> orgList = [];

    if (json is List) {
      for (final dynamic outerElement in json) {
        if (outerElement is List) {
          for (final dynamic innerElement in outerElement) {
            if (innerElement is Map<String, dynamic>) {
              final OrgInfo org = OrgInfo.fromJson(innerElement);
              orgList.add(org);
            }
          }
        } else if (outerElement is Map<String, dynamic>) {
          final OrgInfo org = OrgInfo.fromJson(outerElement);
          orgList.add(org);
        }
      }
    }

    return orgList;
  }

  /// Converts a JSON array to a list of OrgInfo instances.
  ///
  /// **params**:
  /// * `data`: The JSON array to be parsed.
  ///
  /// **returns**:
  /// * `List<OrgInfo>`: A list of OrgInfo objects containing the parsed data.
  List<OrgInfo> fromBasicJsonToList(Map<String, dynamic>? data) {
    final List<OrgInfo> orgList = [];
    if (data != null && data['organizations'] is List) {
      for (final dynamic orgJson in (data['organizations'] as List)) {
        if (orgJson is Map<String, dynamic>) {
          final OrgInfo org = OrgInfo.fromJson(orgJson);
          orgList.add(org);
        }
      }
    }
    return orgList;
  }

  /// The URL of the organization's image.
  @HiveField(0)
  String? image;

  /// The ID of the organization.
  @HiveField(1)
  String? id;

  /// The name of the organization.
  @HiveField(2)
  String? name;

<<<<<<< HEAD
  /// The administrators of the organization.
  @HiveField(3)
  List<User>? admins;

  /// The members of the organization.
  @HiveField(4)
  List<User>? members;

=======
>>>>>>> upstream/develop
  /// The description of the organization.
  @HiveField(5)
  String? description;

  /// Indicates if user registration is required for the organization.
  @HiveField(6)
  bool? userRegistrationRequired;

  /// The city of the organization's address.
  @HiveField(7)
  String? city;

  /// The country code of the organization's address.
  @HiveField(8)
  String? countryCode;

  /// The first line of the organization's address.
  @HiveField(9)
  String? line1;

  /// The second line of the organization's address.
  @HiveField(10)
  String? line2;

  /// The postal code of the organization's address.
  @HiveField(11)
  String? postalCode;

  /// The state of the organization's address.
  @HiveField(12)
  String? state;
<<<<<<< HEAD
=======

  @HiveField(13)

  /// The count of admins in the organization.
  int? adminsCount;

  @HiveField(14)

  /// The count of members in the organization.
  int? membersCount;

  @HiveField(15)

  /// List of members in the organization.
  List<User>? members;

  @HiveField(16)

  /// List of admins in the organization.
  List<User>? admins;
>>>>>>> upstream/develop
}
