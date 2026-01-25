import 'package:hive/hive.dart';
import 'package:talawa/models/events/event_agenda_category.dart';

part 'event_agenda_item.g.dart';

/// Model for Event Agenda Item.
@HiveType(typeId: 14)
class EventAgendaItem {
  EventAgendaItem({
    this.id,
    this.name,
    this.description,
    this.duration,
    this.key,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.attachments,
    this.urls,
    this.categories,
    this.sequence,
  });

  // Factory constructor for creating an AgendaItem instance from a JSON map
  factory EventAgendaItem.fromJson(Map<String, dynamic> json) {
    return EventAgendaItem(
      id: json['id'] != null ? json['id'] as String? : null,
      name: json['name'] != null ? json['name'] as String? : null,
      description:
          json['description'] != null ? json['description'] as String? : null,
      duration: json['duration'] != null ? json['duration'] as String? : null,
      key: json['key'] != null ? json['key'] as String? : null,
      type: json['type'] != null ? json['type'] as String? : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String)
          : null,
      attachments: json['attachments'] != null
          ? List<String>.from(json['attachments'] as List)
          : null,
      urls:
          json['urls'] != null ? List<String>.from(json['urls'] as List) : null,
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((e) => AgendaCategory.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      sequence: json['sequence'] != null
          ? int.tryParse(json['sequence'].toString())
          : null,
    );
  }

  /// Unique identifier for the agenda item.
  @HiveField(0)
  final String? id;

  /// Title of the agenda item.
  @HiveField(1)
  final String? name;

  /// Optional description.
  @HiveField(2)
  final String? description;

  /// Duration of the agenda item.
  @HiveField(3)
  final String? duration;

  /// Optional key for the agenda item.
  @HiveField(4)
  final String? key;

  /// Optional array of attachment URLs.
  @HiveField(5)
  List<String>? attachments;

  /// Optional array of URLs related to the agenda item.
  @HiveField(6)
  List<String>? urls;

  /// Type of the agenda item.
  @HiveField(7)
  final String? type;

  /// Optional array of agenda categories.
  @HiveField(8)
  List<AgendaCategory>? categories;

  /// Sequence number of the agenda item.
  @HiveField(9)
  int? sequence;

  /// Creation date of the agenda item.
  @HiveField(10)
  final DateTime? createdAt;

  /// Last updated date of the agenda item.
  @HiveField(11)
  final DateTime? updatedAt;
}
