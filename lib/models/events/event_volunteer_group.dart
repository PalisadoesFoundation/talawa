import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/user/user_info.dart';

/// This class creates an event volunteer group model and returns an EventVolunteerGroup instance.
class EventVolunteerGroup {
  EventVolunteerGroup({
    this.id,
    this.createdAt,
    this.creator,
    this.event,
    this.leader,
    this.name,
    this.updatedAt,
    this.volunteers,
    this.volunteersRequired,
  });

  // Creating a new EventVolunteerGroup instance from a map structure.
  factory EventVolunteerGroup.fromJson(Map<String, dynamic> json) {
    return EventVolunteerGroup(
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(
              json['creator'] as Map<String, dynamic>,
            ),
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
      leader: json['leader'] == null
          ? null
          : User.fromJson(
              json['leader'] as Map<String, dynamic>,
            ),
      name: json['name'] as String?,
      updatedAt: json['updatedAt'] as String?,
      volunteers: (json['volunteers'] as List<dynamic>?)
          ?.map((e) => EventVolunteer.fromJson(e as Map<String, dynamic>))
          .toList(),
      volunteersRequired: json['volunteersRequired'] as int?,
    );
  }

  /// Unique identifier for the event volunteer group.
  String? id;

  /// The creation date of the event volunteer group.
  String? createdAt;

  /// The creator of the event volunteer group.
  User? creator;

  /// The event associated with the event volunteer group.
  Event? event;

  /// The leader of the event volunteer group.
  User? leader;

  /// The name of the event volunteer group.
  String? name;

  /// The last update date of the event volunteer group.
  String? updatedAt;

  /// The list of volunteers in the event volunteer group.
  List<EventVolunteer>? volunteers;

  /// The number of volunteers required for the event volunteer group.
  int? volunteersRequired;
}
