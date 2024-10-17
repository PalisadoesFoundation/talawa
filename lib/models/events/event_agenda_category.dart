///This class creates an event agenda category model.
class AgendaCategory {
  AgendaCategory({
    this.id,
    this.name,
    this.description,
  });

  /// Creates a new `AgendaCategory` instance from a JSON map.
  factory AgendaCategory.fromJson(Map<String, dynamic> json) {
    return AgendaCategory(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );
  }

  /// Id of the agenda category.
  final String? id;

  /// Name of the category.
  final String? name;

  /// Description of the category.
  final String? description;
}
