import 'package:talawa/models/org_info.dart';

class User {
  User(
      {this.adminFor,
      this.createdOrganizations,
      this.email,
      this.firstName,
      required this.id,
      this.image,
      this.joinedOrganizations,
      this.lastName});
  String id;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  List<OrgInfo>? joinedOrganizations;
  List<OrgInfo>? createdOrganizations;
  List<OrgInfo>? adminFor;
}
