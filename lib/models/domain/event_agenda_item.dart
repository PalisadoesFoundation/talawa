import 'package:talawa/models/domain/event_agenda_category.dart';

/// Clean domain model for event agenda items
class EventAgendaItem {
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

  final String id;
  final String? name;
  final String? description;
  final String? duration;
  final String? key;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? attachments;
  final List<String>? urls;
  final List<EventAgendaCategory>? categories;
  final int? sequence;

  // Computed properties
  String get displayName => name ?? 'Unnamed Item';
  bool get hasDescription => description != null && description!.isNotEmpty;
  bool get hasAttachments => attachments != null && attachments!.isNotEmpty;
  int get attachmentCount => attachments?.length ?? 0;
}
