import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

part 'event_model.g.dart';

///This class creates an event model and returns an Event instance.
@HiveType(typeId: 10)
class Event {
  Event({
    this.id,
    this.name,
    this.description,
    this.attendees,
    this.location,
    this.recurring,
    this.allDay,
    this.startAt,
    this.endAt,
    this.isPublic,
    this.isRegistered,
    this.isRegisterable,
    this.creator,
    this.organization,
    this.admins,
    this.agendaItems,
  });
  //Creating a new Event instance from a map structure.
  factory Event.fromJson(
    Map<String, dynamic> json,
  ) {
    return Event(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      recurring: json['recurring'] as bool?,
      allDay: json['allDay'] as bool?,
      startAt: json['startAt'] != null
          ? DateTime.tryParse(json['startAt'] as String)
          : null,
      endAt: json['endAt'] != null
          ? DateTime.tryParse(json['endAt'] as String)
          : null,
      isPublic: json['isPublic'] as bool?,
      isRegistered: json['isRegistered'] as bool?,
      isRegisterable: json['isRegisterable'] as bool?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      organization: json['organization'] == null
          ? null
          : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      attendees: (json["attendees"] as List<dynamic>?)?.isEmpty ?? true
          ? null
          : (json['attendees'] as List<dynamic>?)
              ?.map((e) => Attendee.fromJson(e as Map<String, dynamic>))
              .toList(),
      agendaItems: json['agendaItems'] == null
          ? null
          : (json['agendaItems'] as List<dynamic>)
              .map((e) => EventAgendaItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  /// Computed property: formatted start date (e.g. "2025-07-30").
  String? get startDate =>
      startAt != null ? DateFormat('yyyy-MM-dd').format(startAt!) : null;

  /// Computed property: formatted end date (e.g. "2025-07-31").
  String? get endDate =>
      endAt != null ? DateFormat('yyyy-MM-dd').format(endAt!) : null;

  /// Computed property: formatted start time (e.g. "09:00 AM").
  String get startTime =>
      startAt != null ? DateFormat('hh:mm a').format(startAt!) : '';

  /// Computed property: formatted end time (e.g. "05:00 PM").
  String get endTime =>
      endAt != null ? DateFormat('hh:mm a').format(endAt!) : '';

  /// Unique identifier for the event.
  @HiveField(0)
  String? id;

  /// The title of the event.
  @HiveField(1)
  String? name;

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

  /// The start DateTime of the event.
  @HiveField(6)
  DateTime? startAt;

  /// The end DateTime of the event.
  @HiveField(7)
  DateTime? endAt;

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

  /// Agenda items associated with the event.
  @HiveField(17)
  List<EventAgendaItem>? agendaItems;
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
