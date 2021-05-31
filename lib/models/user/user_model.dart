import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/organization/organization_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User(
      {this.adminFor,
      this.createdOrganizations,
      this.email,
      required this.firstName,
      required this.id,
      this.image,
      this.joinedOrganizations,
      required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String id;
  String firstName;
  String lastName;
  String? email;
  String? image;
  List<Organization>? joinedOrganizations;
  List<Organization>? createdOrganizations;
  List<Organization>? adminFor;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
