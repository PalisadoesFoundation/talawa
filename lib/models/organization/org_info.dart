// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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

  List<OrgInfo> fromJsonToList(List<dynamic> json) {
    final List<OrgInfo> orgList = [];
    json.forEach((element) {
      final OrgInfo org = OrgInfo.fromJson(element as Map<String, dynamic>);
      orgList.add(org);
    });
    return orgList;
  }

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
}
