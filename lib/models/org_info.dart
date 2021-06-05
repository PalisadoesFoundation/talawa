import 'package:hive/hive.dart';
import 'package:talawa/models/user_info.dart';

part 'org_info.g.dart';

@HiveType(typeId: 2)
class OrgInfo {
  OrgInfo(
      {this.admins,
      this.members,
      this.creatorInfo,
      this.description,
      this.id,
      this.image,
      this.isPublic,
      this.name});

  factory OrgInfo.fromJson(Map<String, dynamic> json) {
    return OrgInfo(
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      isPublic: json['isPublic'] as bool?,
      creatorInfo:
          User.fromJson(json['creator'] as Map<String, dynamic>, fromOrg: true),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true))
          .toList(),
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true))
          .toList(),
      id: json['_id'] as String,
    );
  }

  List<OrgInfo> fromJsonToList(List<dynamic> json) {
    List<OrgInfo>? _orgList = [];
    json.forEach((element) {
      final OrgInfo org = OrgInfo.fromJson(element as Map<String, dynamic>);
      _orgList.add(org);
    });
    return _orgList;
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
