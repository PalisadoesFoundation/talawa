import 'package:hive/hive.dart';
import 'package:talawa/models/user/user_info.dart';

part 'org_info.g.dart';

@HiveType(typeId: 2)

///This class creates an organization-information model and returns an OrgInfo instance.
class OrgInfo {
  OrgInfo({
    this.admins,
    this.members,
    this.creatorInfo,
    this.description,
    this.id,
    this.image,
    this.isPublic,
    this.name,
  });

  factory OrgInfo.fromJson(
    Map<String, dynamic> json1, {
    bool memberRequest = false,
  }) {
    Map<String, dynamic> json;
    if (memberRequest) {
      json = json1['organization'] as Map<String, dynamic>;
    } else {
      json = json1;
    }
    return OrgInfo(
      id: json['_id'] != null ? json['_id'] as String : null,
      image: json['image'] != null ? json['image'] as String? : null,
      name: json['name'] != null ? json['name'] as String? : null,
      description:
          json['description'] != null ? json['description'] as String? : null,
      isPublic: json['isPublic'] != null ? json['isPublic'] as bool? : null,
      creatorInfo: json['creator'] != null
          ? User.fromJson(
              json['creator'] as Map<String, dynamic>,
              fromOrg: true,
            )
          : null,
      members: json['members'] != null
          ? (json['members'] as List<dynamic>?)
              ?.map(
                (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
              )
              .toList()
          : null,
      admins: json['admins'] != null
          ? (json['admins'] as List<dynamic>?)
              ?.map(
                (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
              )
              .toList()
          : null,
    );
  }

  /// The conventional function to parse json, check flutter docs to know more.
  ///
  ///
  /// **params**:
  /// * `json`: Passing the json to be parsed.
  ///
  /// **returns**:
  /// * `List<OrgInfo>`: returning the OrgInfo object containing the json data
  List<OrgInfo> fromJsonToList(dynamic json) {
    final List<OrgInfo> orgList = [];

    if (json is List) {
      for (final dynamic outerElement in json) {
        if (outerElement is List) {
          for (final dynamic innerElement in outerElement) {
            if (innerElement is Map<String, dynamic>) {
              print(68);
              final OrgInfo org = OrgInfo.fromJson(innerElement);
              orgList.add(org);
            } else {
              print(
                'Unexpected type for inner element: ${innerElement.runtimeType}',
              );
            }
          }
        } else if (outerElement is Map<String, dynamic>) {
          // Handle the case when the outer element is directly a map
          print(68);
          final OrgInfo org = OrgInfo.fromJson(outerElement);
          orgList.add(org);
        } else {
          print(
            'Unexpected type for outer element: ${outerElement.runtimeType}',
          );
        }
      }
    } else {
      print('Unexpected type for json: ${json.runtimeType}');
    }

    return orgList;
  }

  /// contains the Image url.
  @HiveField(0)
  String? image;

  /// The org id.
  @HiveField(1)
  String? id;

  /// The org name.
  @HiveField(2)
  String? name;

  /// The org admins.
  @HiveField(3)
  List<User>? admins;

  /// The org name.
  @HiveField(4)
  List<User>? members;

  /// The org descriptions.
  @HiveField(5)
  String? description;

  /// The org visibility.
  @HiveField(6)
  bool? isPublic;

  /// The org creatorInfo.
  @HiveField(7)
  User? creatorInfo;
}
