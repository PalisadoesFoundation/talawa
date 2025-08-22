import 'package:hive/hive.dart';

part 'org_info.g.dart';

/// This class creates an organization-information model and returns an OrgInfo instance.
@HiveType(typeId: 2)
class OrgInfo {
  /// Constructs an OrgInfo object.
  OrgInfo({
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
    this.adminsCount,
    this.membersCount,
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
    return OrgInfo(
      id: json['id'] != null ? json['id'] as String : null,
      image: json['avatarURL'] != null ? json['avatarURL'] as String? : null,
      name: json['name'] != null ? json['name'] as String? : null,
      description:
          json['description'] != null ? json['description'] as String? : null,
      userRegistrationRequired: json['isUserRegistrationRequired'] != null
          ? json['isUserRegistrationRequired'] as bool?
          : null,
      city: json['city'] as String?,
      countryCode: json['countryCode'] as String?,
      line1: json['addressLine1'] as String?,
      line2: json['addressLine2'] as String?,
      postalCode: json['postalCode'] as String?,
      state: json['state'] as String?,
      adminsCount:
          json['adminsCount'] != null ? json['adminsCount'] as int? : null,
      membersCount:
          json['membersCount'] != null ? json['membersCount'] as int? : null,
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

  @HiveField(13)

  /// The count of admins in the organization.
  int? adminsCount;

  @HiveField(14)

  /// The count of members in the organization.
  int? membersCount;
}
