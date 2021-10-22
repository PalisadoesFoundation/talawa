/// Imported packages
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

class Event {  
  ///Creates an event object
  Event(
      {this.id,
      this.title,
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
      this.isRegistered,
      this.isRegisterable,
      this.creator,
      this.organization,
      this.admins,
      this.registrants});

  /// Returns a runtime instance of the Event class
  factory Event.fromJson(
    Map<String, dynamic> json,
  ) {
    return Event(
      id: json['_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      attendees: json['attendees'] as String?,
      location: json['location'] as String?,
      
      /// only true if the event occurs repeatedly
      recurring: json['recurring'] as bool?,

      /// only true if the event lasts all day (12 am to 12 midnight)
      allDay: json['allDay'] as bool?,

      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      recurrence: json['recurrence'] as String?,

      /// only true if the event is a public one
      isPublic: json['isPublic'] as bool?,

      /// only true if the user is registered for this event
      isRegistered: json['isSubscribed'] as bool?,

      /// only true if users can register for the event
      isRegisterable: json['isRegisterable'] as bool?,

      /// Giving [creator] a default value of null
      ///
      /// Returns a parsed User object and creates the corresponding g.dart file
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>,
              fromOrg: true),
      
      /// Giving [organization] a default value of null
      ///
      /// Returns a parsed Organization object and creates the corresponding g.dart file
      organization: json['organization'] == null
          ? null
          : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      
      /// Giving [admins] a default value of null
      ///
      /// Returns a parsed list of User objects who are considered admins and creates the corresponding g.dart file
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
  String? id;
  String? title;
  String? description;
  String? attendees;
  String? location;
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
