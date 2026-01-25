class EventAgendaCategory {
  const EventAgendaCategory({
    required this.id,
    this.name,
    this.description,
  });

  final String id;
  final String? name;
  final String? description;

  // Computed properties
  String get displayName => name ?? 'Unnamed Category';
  bool get hasDescription => description != null && description!.isNotEmpty;
}
