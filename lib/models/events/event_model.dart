import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
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
    this.schemaVersion,
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
          : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      attachments: json['attachments'] != null
          ? (json['attachments'] as List<dynamic>)
              .map((attachment) =>
                  Attachment.fromJson(attachment as Map<String, dynamic>),)
              .toList()
          : null,
      schemaVersion: json['schemaVersion'] as int? ?? 2,
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
  List<Attachment>? attachments;

  /// Schema version for migration purposes.
  @HiveField(8)
  int? schemaVersion = 2;

  /// Cached DateTime object for the start time to avoid repeated parsing.
  DateTime? _cachedStartDateTime;

  /// Cached DateTime object for the end time to avoid repeated parsing.
  DateTime? _cachedEndDateTime;

  // DateFormat instances for consistent formatting
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat _timeFormat = DateFormat('HH:mm:ss');

  /// Returns the start date of the event in 'yyyy-MM-dd' format, or null if unavailable or parsing fails.
  String? get startDate {
    if (startAt == null) return null;

    // Use cached DateTime if available
    if (_cachedStartDateTime != null) {
      return _dateFormat.format(_cachedStartDateTime!);
    }

    // Parse and cache the DateTime
    _cachedStartDateTime = DateTime.tryParse(startAt!);
    if (_cachedStartDateTime == null) {
      // Log parsing error for debugging
      print('Failed to parse startAt: $startAt');
      return null;
    }

    return _dateFormat.format(_cachedStartDateTime!);
  }

  /// Returns the start time of the event in 'HH:mm:ss' format, or null if unavailable or parsing fails.
  String? get startTime {
    if (startAt == null) return null;

    // Use cached DateTime if available
    if (_cachedStartDateTime != null) {
      return _timeFormat.format(_cachedStartDateTime!);
    }

    // Parse and cache the DateTime
    _cachedStartDateTime = DateTime.tryParse(startAt!);
    if (_cachedStartDateTime == null) {
      // Log parsing error for debugging
      print('Failed to parse startAt: $startAt');
      return null;
    }

    return _timeFormat.format(_cachedStartDateTime!);
  }

  /// Returns the end date of the event in 'yyyy-MM-dd' format, or null if unavailable or parsing fails.
  String? get endDate {
    if (endAt == null) return null;

    // Use cached DateTime if available
    if (_cachedEndDateTime != null) {
      return _dateFormat.format(_cachedEndDateTime!);
    }

    // Parse and cache the DateTime
    _cachedEndDateTime = DateTime.tryParse(endAt!);
    if (_cachedEndDateTime == null) {
      // Log parsing error for debugging
      print('Failed to parse endAt: $endAt');
      return null;
    }

    return _dateFormat.format(_cachedEndDateTime!);
  }

  /// Returns the end time of the event in 'HH:mm:ss' format, or null if unavailable or parsing fails.
  ///
  /// This getter extracts and formats the time portion from the [endAt] property,
  /// returning it as a string in 'HH:mm:ss' format, or null if [endAt] is not set or cannot be parsed.
  String? get endTime {
    if (endAt == null) return null;

    // Use cached DateTime if available
    if (_cachedEndDateTime != null) {
      return _timeFormat.format(_cachedEndDateTime!);
    }

    // Parse and cache the DateTime
    _cachedEndDateTime = DateTime.tryParse(endAt!);
    if (_cachedEndDateTime == null) {
      // Log parsing error for debugging
      print('Failed to parse endAt: $endAt');
      return null;
    }

    return _timeFormat.format(_cachedEndDateTime!);
  }
}

/// This class creates an attachment model and returns an Attachment instance.
@HiveType(typeId: 12)
class Attachment {
  Attachment({
    this.id,
    this.name,
    this.url,
    this.type,
    this.size,
  });

  /// Creates an Attachment instance from a JSON map.
  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id']?.toString() ?? json['_id']?.toString(),
      name: json['name']?.toString(),
      url: json['url']?.toString(),
      type: json['type']?.toString(),
      size: json['size'] is int 
          ? json['size'] as int 
          : json['size'] is String 
              ? int.tryParse(json['size'] as String)
              : null,
    );
  }

  /// Unique identifier for the attachment.
  @HiveField(0)
  String? id;

  /// The name of the attachment file.
  @HiveField(1)
  String? name;

  /// The URL where the attachment can be accessed.
  @HiveField(2)
  String? url;

  /// The MIME type of the attachment.
  @HiveField(3)
  String? type;

  /// The size of the attachment in bytes.
  @HiveField(4)
  int? size;

  /// Converts the Attachment instance to a map structure.
  ///
  /// This method is used to convert the Attachment instance to a map structure that can be converted to a JSON object.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: A map structure that can be converted to a JSON object.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['type'] = this.type;
    data['size'] = this.size;
    return data;
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
