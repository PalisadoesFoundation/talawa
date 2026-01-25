class ChatUser {
  const ChatUser({
    required this.id,
    this.firstName,
    this.image,
  });

  final String id;
  final String? firstName;
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
