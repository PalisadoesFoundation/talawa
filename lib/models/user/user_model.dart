import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/organization/organization_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
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
  List<Organization>? joinedOrganizations;
  List<Organization>? createdOrganizations;
  List<Organization>? adminFor;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
