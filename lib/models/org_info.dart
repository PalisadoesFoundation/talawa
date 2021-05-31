import 'package:talawa/models/user_info.dart';

class OrgInfo {
  OrgInfo(
      {this.admins,
      this.creatorInfo,
      this.description,
      required this.id,
      this.image,
      this.isPublic,
      this.name});
  String? image;
  String id;
  String? name;
  List<User>? admins;
  String? description;
  bool? isPublic;
  User? creatorInfo;
}
