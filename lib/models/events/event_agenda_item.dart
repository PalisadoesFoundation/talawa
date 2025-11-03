import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

/// enum for agenda Item type.
enum ItemType {
  /// regular type agenda item.
  regular,

  /// note type agenda item.
  note,
}

/// Model for Event Agenda Item.
class EventAgendaItem {
  EventAgendaItem({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.attachments,
    this.createdBy,
    this.urls,
    this.relatedEvent,
    this.categories,
    this.sequence,
    // this.itemType,
    // this.isNote,
    this.organization,
  });
  // Factory constructor for creating an AgendaItem instance from a JSON map
  factory EventAgendaItem.fromJson(Map<String, dynamic> json) {
    return EventAgendaItem(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      duration: json['duration'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdBy: json['createdBy'] != null
          ? User.fromJson(
              json['createdBy'] as Map<String, dynamic>,
            )
          : null,
      urls: (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
      relatedEvent: json['relatedEvent'] != null
          ? Event.fromJson(json['relatedEvent'] as Map<String, dynamic>)
          : null,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => AgendaCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      sequence: json['sequence'] as int?,
      organization: json['organization'] != null
          ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Unique identifier for the agenda item.
  final String? id;

  /// Title of the agenda item.
  final String? title;

  /// Optional description.
  final String? description;

  /// Duration of the agenda item.
  final String? duration;

  /// Optional array of attachment URLs.
  final List<String>? attachments;

  /// Reference to the user who created the agenda item.
  final User? createdBy;

  /// Optional array of URLs related to the agenda item.
  final List<String>? urls;

  /// Reference to the event associated with the agenda item.
  final Event? relatedEvent;

  /// Optional array of agenda categories.
  final List<AgendaCategory>? categories;

  /// Sequence number of the agenda item.
  final int? sequence;

  ///Reference to the organization associated with the agenda item.
  final OrgInfo? organization;
}
