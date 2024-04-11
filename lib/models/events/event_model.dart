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
  });
  //Creating a new Event instance from a map structure.
  factory Event.fromJson(
    Map<String, dynamic> json,
  ) {
    return Event(
      id: json['_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
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
          : User.fromJson(
              json['creator'] as Map<String, dynamic>,
              fromOrg: true,
            ),
      organization: json['organization'] == null
          ? null
          : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      admins: json['admins'] == null
          ? null
          : (json['admins'] as List<dynamic>?)
              ?.map(
                (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
              )
              .toList(),
      attendees: (json["attendees"] as List<dynamic>?)?.isEmpty ?? true
          ? null
          : (json['attendees'] as List<dynamic>?)
              ?.map(
                (e) => Attendee.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  ///Unique identifier for the event.
  String? id;

  /// The title of the event.
  String? title;

  /// The description of the event.
  String? description;

  /// The location of the event.
  String? location;

  /// The latitude of the event.
  double? latitude;

  /// The longitude of the event.
  double? longitude;

  /// A boolean value that indicates if the event is recurring.
  bool? recurring;

  /// A boolean value that indicates if the event is an all-day event.
  bool? allDay;

  /// The start date of the event.
  String? startDate;

  /// The end date of the event.
  String? endDate;

  /// The start time of the event.
  String? startTime;

  /// The end time of the event.
  String? endTime;

  /// The recurrence of the event.
  String? recurrence;

  /// A boolean value that indicates if the event is public.
  bool? isPublic;

  /// A boolean value that indicates if the user is registered for the event.
  bool? isRegistered;

  /// A boolean value that indicates if the event is registerable.
  bool? isRegisterable;

  /// The creator of the event.
  User? creator;

  /// The organization of the event.
  OrgInfo? organization;

  /// The admins of the event.
  List<User>? admins;

  /// The attendees of the event.
  List<Attendee>? attendees;
}

///This class creates an attendee model and returns an Attendee instance.
class Attendee {
  Attendee({this.id, this.firstName, this.lastName, this.image});

  Attendee.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    image = json['image'] as String?;
  }

  ///Unique identifier for the attendee.
  String? id;

  /// The first name of the attendee.
  String? firstName;

  /// The last name of the attendee.
  String? lastName;

  /// The image of the attendee.
  String? image;

  /// Converts the Attendee instance to a map structure..
  ///
  /// This method is used to convert the Attendee instance to a map structure that can be converted to a JSON object.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: A map structure that can be converted to a JSON object.

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['image'] = this.image;
    return data;
  }
}
