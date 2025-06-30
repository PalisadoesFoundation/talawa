import 'package:hive/hive.dart';
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
    this.startAt,
    this.endAt,
    this.organization,
    this.creator,
    this.attachments,
  });

  // Creating a new Event instance from a map structure.
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id']?.toString() ?? json['_id']?.toString(),
      name: json['name']?.toString() ?? json['title']?.toString(),
      description: json['description']?.toString(),
      startAt: json['startAt']?.toString(),
      endAt: json['endAt']?.toString(),
      organization: json['organization'] == null
          ? null
          : OrgInfo(
              id: json['organization']['id']?.toString(),
              name: json['organization']['name']?.toString(),
            ),
      creator: json['creator'] == null
          ? null
          : User(
              id: json['creator']['id']?.toString(),
              firstName: json['creator']['name']?.toString(),
            ),
      attachments: json['attachments'] as List<dynamic>?,
    );
  }

  /// Unique identifier for the event.
  @HiveField(0)
  String? id;

  /// The name/title of the event.
  @HiveField(1)
  String? name;

  /// The description of the event.
  @HiveField(2)
  String? description;

  /// The start datetime of the event (ISO8601 string).
  @HiveField(3)
  String? startAt;

  /// The end datetime of the event (ISO8601 string).
  @HiveField(4)
  String? endAt;

  /// The organization of the event (minimal info).
  @HiveField(5)
  OrgInfo? organization;

  /// The creator of the event (minimal info).
  @HiveField(6)
  User? creator;

  /// Attachments for the event.
  @HiveField(7)
  List<dynamic>? attachments;

  String? get startDate {
    if (startAt == null) return null;
    try {
      final dt = DateTime.parse(startAt!);
      return "${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return null;
    }
  }

  String? get startTime {
    if (startAt == null) return null;
    try {
      final dt = DateTime.parse(startAt!);
      return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}";
    } catch (e) {
      return null;
    }
  }

  String? get endDate {
    if (endAt == null) return null;
    try {
      final dt = DateTime.parse(endAt!);
      return "${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return null;
    }
  }

  String? get endTime {
    if (endAt == null) return null;
    try {
      final dt = DateTime.parse(endAt!);
      return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}";
    } catch (e) {
      return null;
    }
  }
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
