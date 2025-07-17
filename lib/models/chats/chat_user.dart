/// The `ChatUser` class represents a user in the chat system.
class ChatUser {
  /// Constructs a `ChatUser` instance.
  ///
  /// [firstName] is the first name of the user.
  /// [id] is the unique identifier of the user.
  /// [image] is the URL of the user's profile image.
  ChatUser({
    this.firstName,
    this.id,
    this.image,
  });

  /// Creates a `ChatUser` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the user data.
  /// Handles the new PostgreSQL API format with 'name' and 'avatarURL' fields.
  ///
  /// **params**:
  /// * `json`: Map containing user data from API
  ///
  /// **returns**:
  /// * `ChatUser`: Parsed chat user instance
  factory ChatUser.fromJson(Map<String, dynamic> json) {
    // Handle new PostgreSQL API format - extract first name from full name
    String? firstName;
    if (json['name'] != null) {
      final String fullName = json['name'] as String;
      if (fullName.isNotEmpty) {
        final List<String> nameParts = fullName.split(' ');
        firstName = nameParts.isNotEmpty ? nameParts[0] : null;
      }
    }

    return ChatUser(
      firstName: firstName,
      id: json['id'] as String?,
      image: json['avatarURL'] as String?,
    );
  }

  /// Converts the `ChatUser` instance to a JSON object.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: JSON representation of the chat user
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'id': id,
      'avatarURL': image,
    };
  }

  /// The first name of the user.
  String? firstName;

  /// The unique identifier of the user.
  String? id;

  /// The URL of the user's profile image.
  String? image;
}
