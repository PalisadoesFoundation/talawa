import 'package:json_annotation/json_annotation.dart';
part 'organization_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Organization {
  Organization(
    this.id,
    this.image,
    this.name,
  );
  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  String? id;
  String? image;
  String? name;

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
