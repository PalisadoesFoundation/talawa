/// Clean domain model for chat users.
///
/// Represents a user in the chat system with display properties.
class ChatUser {
  /// Creates a ChatUser instance.
  const ChatUser({
    required this.id,
    this.firstName,
    this.image,
  });

  /// Unique identifier for the user.
  final String id;

  /// First name of the user.
  final String? firstName;

  /// URL of the user's profile image.
  final String? image;

  // Computed properties
  String get displayName => firstName ?? 'Unknown';

  String get initials {
    if (firstName != null && firstName!.isNotEmpty) {
      return firstName!.substring(0, 1).toUpperCase();
    }
    return '?';
  }

  bool get hasImage => image != null && image!.isNotEmpty;
}
