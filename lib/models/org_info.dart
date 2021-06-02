import 'package:talawa/models/user_info.dart';

class OrgInfo {
  OrgInfo(
      {this.admins,
      this.members,
      this.creatorInfo,
      this.description,
      required this.id,
      this.image,
      this.isPublic,
      this.name});

  factory OrgInfo.fromJson(Map<String, dynamic> json) {
    return OrgInfo(
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      isPublic: json['isPublic'] as bool?,
      creatorInfo: json['creator'] as User?,
      members: (json['members'] as List<User>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>, 'null'))
          .toList(),
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>, 'null'))
          .toList(),
      id: json['_id'] as String,
    );
  }

  String? image;
  String id;
  String? name;
  List<User>? admins;
  List<User>? members;
  String? description;
  bool? isPublic;
  User? creatorInfo;
}
