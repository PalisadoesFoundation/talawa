import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/user/user_model.dart';
part 'organization_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Organization {
  Organization(
      this.apiUrl,
      this.image,
      this.name,
      this.description,
      this.isPublic,
      this.creator,
      this.members,
      this.admins,
      this.visibleInSearch);

  String? apiUrl;
  String? image;
  String? name;
  String? description;
  String? isPublic;
  String? creator;
  List<User>? members;
  List<User>? admins;
  bool? visibleInSearch;
  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
