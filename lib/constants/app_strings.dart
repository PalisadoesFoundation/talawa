class TalawaErrors {
  /// GraphQL error for handling: User not found.
  static const String userNotFound = 'User not found';

  /// GraphQL error for handling: User is not authenticated.
  static const String userNotAuthenticated = 'User is not authenticated';

  /// GraphQL error for handling: Email address already exists.
  static const String emailAccountPresent = 'Email address already exists';

  /// GraphQL error for handling: Invalid credentials.
  static const String wrongCredentials = 'Invalid credentials';

  /// GraphQL error for handling: Organization not found.
  static const String organizationNotFound = 'Organization not found';

  /// GraphQL error for handling: Access Token has expired. Please refresh session.
  static const String refreshAccessTokenExpiredException =
      'Access Token has expired. Please refresh session.';

  /// GraphQL error for handling: Membership Request already exists.
  static const String memberRequestExist = 'Membership Request already exists';

  /// GraphQL error for handling: Failed to determine project ID.
  static const String failedToDetermineProject =
      'Failed to determine project ID: Error while making request: getaddrinfo ENOTFOUND metadata.google.internal. Error code: ENOTFOUND';

  // Error strings for posts
  /// Error for creating a post.
  static const String postCreationFailed =
      'Failed to create post. Please try again.';

  /// Error for updating a post.
  static const String postUpdateFailed =
      'Failed to update post. Please try again.';

  /// Error for deleting a post.
  static const String postDeletionFailed =
      'Failed to delete post. Please try again.';

  // Error strings for events
  /// Error for creating an event.
  static const String eventCreationFailed =
      'Failed to create event. Please try again.';

  /// Error for updating an event.
  static const String eventUpdateFailed =
      'Failed to update event. Please try again.';

  /// Error for deleting an event.
  static const String eventDeletionFailed =
      'Failed to delete event. Please try again.';

  // Error strings for chats
  /// Error for sending a chat message.
  static const String chatMessageSendFailed =
      'Failed to send chat message. Please try again.';

  /// Error for deleting a chat message.
  static const String chatMessageDeletionFailed =
      'Failed to delete chat message. Please try again.';

  // Error strings for user profile
  /// Error for updating user profile.
  static const String userProfileUpdateFailed =
      'Failed to update user profile. Please try again.';

  /// Error for deleting user profile.
  static const String userProfileDeletionFailed =
      'Failed to delete user profile. Please try again.';

  static const String userActionNotSaved = 'User action not saved';

  static const String youAreOfflineUnableToLogin =
      'You are offline, unable to login, please try again later.';

  static const String youAreOfflineUnableToLogout =
      'You are offline, unable to logout, please try again later.';

  static const String youAreOfflineUnableToSignUp =
      'You are Offline, unable to SignUp, please try again later.';
}
