import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

part 'event_model.g.dart';

///This class creates an event model and returns an Event instance.
@HiveType(typeId: 10)
class Event {
  Event({
    this.id,
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
      recurring: json['recurring'] as bool?,
      allDay: json['allDay'] as bool?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
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

  /// Unique identifier for the event.
  @HiveField(0)
  String? id;

  /// The title of the event.
  @HiveField(1)
  String? title;

  /// The description of the event.
  @HiveField(2)
  String? description;

  /// The location of the event.
  @HiveField(3)
  String? location;

  /// A boolean value that indicates if the event is recurring.
  @HiveField(4)
  bool? recurring;

  /// A boolean value that indicates if the event is an all-day event.
  @HiveField(5)
  bool? allDay;

  /// The start date of the event.
  @HiveField(6)
  String? startDate;

  /// The end date of the event.
  @HiveField(7)
  String? endDate;

  /// The start time of the event.
  @HiveField(8)
  String? startTime;

  /// The end time of the event.
  @HiveField(9)
  String? endTime;

  /// A boolean value that indicates if the event is public.
  @HiveField(10)
  bool? isPublic;

  /// A boolean value that indicates if the user is registered for the event.
  @HiveField(11)
  bool? isRegistered;

  /// A boolean value that indicates if the event is registerable.
  @HiveField(12)
  bool? isRegisterable;

  /// The creator of the event.
  @HiveField(13)
  User? creator;

  /// The organization of the event.
  @HiveField(14)
  OrgInfo? organization;

  /// The admins of the event.
  @HiveField(15)
  List<User>? admins;

  /// The attendees of the event.
  @HiveField(16)
  List<Attendee>? attendees;
}

///This class creates an attendee model and returns an Attendee instance.
@HiveType(typeId: 11)
class Attendee {
  Attendee({this.id, this.firstName, this.lastName, this.image});

  Attendee.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    image = json['image'] as String?;
  }

  /// Unique identifier for the attendee.
  @HiveField(0)
  String? id;

  /// The first name of the attendee.
  @HiveField(1)
  String? firstName;

  /// The last name of the attendee.
  @HiveField(2)
  String? lastName;

  /// The image URL of the attendee.
  @HiveField(3)
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
