import 'package:talawa/models/domain/event_agenda_category.dart';

/// Clean domain model for event agenda items.
///
/// Represents an item in an event's agenda with scheduling and categorization.
class EventAgendaItem {
  /// Creates an EventAgendaItem instance.
  const EventAgendaItem({
    required this.id,
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

  /// Unique identifier for the agenda item.
  final String id;

  /// Name of the agenda item.
  final String? name;

  /// Description of the agenda item.
  final String? description;

  /// Duration of the agenda item (e.g., '30 minutes', '1 hour').
  final String? duration;

  /// Unique key for the agenda item.
  final String? key;

  /// Type of the agenda item.
  final String? type;

  /// Timestamp when the agenda item was created.
  final DateTime? createdAt;

  /// Timestamp when the agenda item was last updated.
  final DateTime? updatedAt;

  /// List of attachment URLs for this agenda item.
  final List<String>? attachments;

  /// List of related URLs for this agenda item.
  final List<String>? urls;

  /// Categories this agenda item belongs to.
  final List<EventAgendaCategory>? categories;

  /// Sequence number for ordering agenda items.
  final int? sequence;

  /// Display name for the agenda item, with fallback for unnamed items.
  String get displayName => name ?? 'Unnamed Item';

  /// Whether the agenda item has a non-empty description.
  bool get hasDescription => description != null && description!.isNotEmpty;

  /// Whether the agenda item has any attachments.
  bool get hasAttachments => attachments != null && attachments!.isNotEmpty;

  /// Number of attachments for this agenda item.
  int get attachmentCount => attachments?.length ?? 0;
}
