// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

///This class creates an event model and returns an Event instance.
class Event {
  Event({
    this.id,
    this.title,
    this.description,
    this.attendees,
    this.location,
    this.latitude,
    this.longitude,
    this.recurring,
    this.allDay,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.recurrence,
    this.isPublic,
    this.isRegistered,
    this.isRegisterable,
    this.creator,
    this.organization,
    this.admins,
    this.registrants,
  });
  //Creating a new Event instance from a map structure.
  factory Event.fromJson(
    Map<String, dynamic> json,
  ) {
    return Event(
      id: json['_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      attendees: json['attendees'] as String?,
      location: json['location'] as String?,
      longitude: json['longitude'] as double?,
      latitude: json['latitude'] as double?,
      recurring: json['recurring'] as bool?,
      allDay: json['allDay'] as bool?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      recurrence: json['recurrence'] as String?,
      isPublic: json['isPublic'] as bool?,
      isRegistered: json['isRegistered'] as bool?,
      isRegisterable: json['isRegisterable'] as bool?,
      creator: json['creator'] == null
          ? null
          //Creating a new User instance from a map structure.
          : User.fromJson(
              json['creator'] as Map<String, dynamic>,
              fromOrg: true,
            ),
      organization: json['organization'] == null
          ? null
          //Creating a new OrgInfo instance from a map structure.
          : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      admins: json['admins'] == null
          ? null
          : (json['admins'] as List<dynamic>?)
              ?.map(
                (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
              )
              .toList(),
      registrants: (json['registrants'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>, fromOrg: false))
          .toList(),
    );
  }
  String? id;
  String? title;
  String? description;
  String? attendees;
  String? location;
  double? latitude;
  double? longitude;
  bool? recurring;
  bool? allDay;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? recurrence;
  bool? isPublic;
  bool? isRegistered;
  bool? isRegisterable;
  User? creator;
  OrgInfo? organization;
  List<User>? admins;
  List<User>? registrants;
}
