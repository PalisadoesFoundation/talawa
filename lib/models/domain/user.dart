/// Minimal User domain model for Comment references
/// Full User model will be created in Part 2
class User {
  const User({
    required this.id,
    this.name,
    this.email,
    this.image,
  });

  final String id;
  final String? name;
  final String? email;
  final String? image;

  // Computed properties
  String get displayName => name ?? email ?? 'Unknown User';
}
