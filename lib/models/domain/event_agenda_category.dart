/// Clean domain model for event agenda categories.
///
/// Represents a category for organizing event agenda items.
class EventAgendaCategory {
  /// Creates an EventAgendaCategory instance.
  const EventAgendaCategory({
    required this.id,
    this.name,
    this.description,
  });

  /// Unique identifier for the category.
  final String id;

  /// Name of the category.
  final String? name;

  /// Description of the category.
  final String? description;

  /// Display name for the category, with fallback for unnamed categories.
  String get displayName => name ?? 'Unnamed Category';

  /// Whether the category has a non-empty description.
  bool get hasDescription => description != null && description!.isNotEmpty;
}
