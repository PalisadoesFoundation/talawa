import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/user/user_info.dart';

part 'org_info.g.dart';

/// An OrgInfo object repesents an organization's information details.
///
/// It can be encoded as a string and is generated as TypeAdapter.
@HiveType(typeId: 2)
@JsonSerializable()
class OrgInfo {
  /// Returns a new instance of OrgInfo class
  OrgInfo(
      {this.admins,
      this.members,
      this.creatorInfo,
      this.description,
      this.id,
      this.image,
      this.isPublic,
      this.name});

  /// Factory constructor utilizing the `fromJson` factory.
  factory OrgInfo.fromJson(Map<String, dynamic> json1,
      {bool memberRequest = false}) {
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
          ? User.fromJson(json['creator'] as Map<String, dynamic>,
              fromOrg: true)
          : null,
      members: json['members'] != null
          ? (json['members'] as List<dynamic>?)
              ?.map((e) =>
                  User.fromJson(e as Map<String, dynamic>, fromOrg: true))
              .toList()
          : null,
      admins: json['admins'] != null
          ? (json['admins'] as List<dynamic>?)
              ?.map((e) =>
                  User.fromJson(e as Map<String, dynamic>, fromOrg: true))
              .toList()
          : null,
    );
  }

  /// Returns a list of all OrgInfo objects.
  List<OrgInfo> fromJsonToList(List<dynamic> json) {
    final List<OrgInfo> _orgList = [];
    json.forEach((element) {
      final OrgInfo org = OrgInfo.fromJson(element as Map<String, dynamic>);
      _orgList.add(org);
    });
    return _orgList;
  }

  /// fields annotated for HiveType
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? name;
  @HiveField(3)
  List<User>? admins;
  @HiveField(4)
  List<User>? members;
  @HiveField(5)
  String? description;
  @HiveField(6)
  bool? isPublic;
  @HiveField(7)
  User? creatorInfo;

  /// Prints the properties for OrgInfo object to the console.
  printOrgInfo() {
    debugPrint('_id: ${this.id}');
    debugPrint('name: ${this.name}');
    debugPrint('image: ${this.image}');
    debugPrint('description: ${this.description}');
    debugPrint('isPublic: ${this.isPublic}');
    debugPrint('creatorInfo: ${this.creatorInfo}');
    debugPrint('admins: ${this.admins}');
    debugPrint('members: ${this.members}');
  }
}
