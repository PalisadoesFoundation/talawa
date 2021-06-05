import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/organization/organization_model.dart';
import 'package:talawa/models/user/user_model.dart';

part 'event_model.g.dart';

@JsonSerializable()
class Event {
  Event(
      this.title,
      this.description,
      this.attendees,
      this.location,
      // ignore: avoid_positional_boolean_parameters
      this.recurring,
      this.allDay,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.recurrance,
      this.isPublic,
      this.isSubscribed,
      this.isRegisterable,
      this.creator,
      this.organization,
      this.admins,
      this.registrants);
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  String? title;
  String? description;
  String? attendees;
  String? location;
  String? recurring;
  String? allDay;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? recurrance;
  String? isPublic;
  String? isSubscribed;
  String? isRegisterable;
  User? creator;
  Organization? organization;
  List<User>? admins;
  List<User>? registrants;

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
