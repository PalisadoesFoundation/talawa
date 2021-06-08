import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

class Event {
  Event(
      {this.title,
      this.description,
      this.attendees,
      this.location,
      this.recurring,
      this.allDay,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.recurrence,
      this.isPublic,
      this.isSubscribed,
      this.isRegisterable,
      this.creator,
      this.organization,
      this.admins,
      this.registrants});

  factory Event.fromJson(
    Map<String, dynamic> json,
  ) {
    return Event(
      title: json['title'] as String?,
      description: json['description'] as String?,
      attendees: json['attendees'] as String?,
      location: json['location'] as String?,
      recurring: json['recurring'] as String?,
      allDay: json['allDay'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      recurrence: json['recurrence'] as String?,
      isPublic: json['isPublic'] as String?,
      isSubscribed: json['isSubscribed'] as String?,
      isRegisterable: json['isRegisterable'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>,
              fromOrg: true),
      organization: json['organization'] == null
          ? null
          : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      admins: json['admins'] == null
          ? null
          : (json['admins'] as List<dynamic>?)
              ?.map((e) =>
                  User.fromJson(e as Map<String, dynamic>, fromOrg: true))
              .toList(),
      registrants: (json['registrants'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true))
          .toList(),
    );
  }

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
  String? recurrence;
  String? isPublic;
  String? isSubscribed;
  String? isRegisterable;
  User? creator;
  OrgInfo? organization;
  List<User>? admins;
  List<User>? registrants;
}
