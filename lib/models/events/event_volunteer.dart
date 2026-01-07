import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';

/// This class creates an event volunteer model and returns an EventVolunteer instance.
class EventVolunteer {
  EventVolunteer({
    this.id,
    this.creator,
    this.event,
    this.group,
    this.isAssigned,
    this.isInvited,
    this.response,
    this.user,
  });

  // Creating a new EventVolunteer instance from a map structure.
  factory EventVolunteer.fromJson(Map<String, dynamic> json) {
    return EventVolunteer(
      id: json['_id'] as String?,
      creator: json['creator'] != null
          ? User.fromJson(
              json['creator'] as Map<String, dynamic>,
            )
          : null,
      event: json['event'] != null
          ? Event.fromJson(json['event'] as Map<String, dynamic>)
          : null,
      group: json['group'] != null
          ? EventVolunteerGroup.fromJson(json['group'] as Map<String, dynamic>)
          : null,
      isAssigned: json['isAssigned'] as bool?,
      isInvited: json['isInvited'] as bool?,
      response: json['response'] as String?,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Unique identifier for the event volunteer.
  String? id;

  /// The creation date of the event volunteer.
  String? createdAt;

  /// The creator of the event volunteer.
  User? creator;

  /// The event associated with the event volunteer.
  Event? event;

  /// The group associated with the event volunteer.
  EventVolunteerGroup? group;

  /// A boolean value that indicates if the volunteer is assigned.
  bool? isAssigned;

  /// A boolean value that indicates if the volunteer is invited.
  bool? isInvited;

  /// The response of the volunteer.
  String? response;

  /// The last update date of the event volunteer.
  String? updatedAt;

  /// The user who is the volunteer.
  User? user;
}
