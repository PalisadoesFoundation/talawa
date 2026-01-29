/// Minimal User domain model for Comment references.
///
/// Full User model will be created in Part 2.
class User {
  /// Creates a User instance.
  const User({
    required this.id,
    this.name,
    this.email,
    this.image,
  });

  /// Unique identifier for the user.
  final String id;

  /// Name of the user.
  final String? name;

  /// Email address of the user.
  final String? email;

  /// URL of the user's profile image.
  final String? image;

  /// Display name for the user, with fallback to email or 'Unknown User'.
  String get displayName => name ?? email ?? 'Unknown User';
}
