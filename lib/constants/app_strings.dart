/// Talawa Custom error strings.
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

  /// Error for creating a post.
  static const String postCreationFailed =
      'You are offline. Failed to create post. Please try again.';

  /// Error for updating a post.
  static const String postUpdateFailed =
      'You are offline. Failed to update post. Please try again.';

  /// Error for deleting a post.
  static const String postDeletionFailed =
      'You are offline. Failed to delete post. Please try again.';

  /// Error for creating an event.
  static const String eventCreationFailed =
      'You are offline. Failed to create event. Please try again.';

  /// Error for updating an event.
  static const String eventUpdateFailed =
      'You are offline. Failed to update event. Please try again.';

  /// Error for deleting an event.
  static const String eventDeletionFailed =
      'You are offline. Failed to delete event. Please try again.';

  /// Error for sending a chat message.
  static const String chatMessageSendFailed =
      'You are offline. Failed to send chat message. Please try again.';

  /// Error for deleting a chat message.
  static const String chatMessageDeletionFailed =
      'You are offline. Failed to delete chat message. Please try again.';

  /// Error for updating user profile.
  static const String userProfileUpdateFailed =
      'You are offline. Failed to update user profile. Please try again.';

  /// Error for deleting user profile.
  static const String userProfileDeletionFailed =
      'You are offline. Failed to delete user profile. Please try again.';

  /// Error for saving user action.
  static const String userActionNotSaved =
      'You are offline. User action not saved.';

  /// Error for login attempt when offline.
  static const String youAreOfflineUnableToLogin =
      'You are offline, unable to login, please try again later.';

  /// Error for logout attempt when offline.
  static const String youAreOfflineUnableToLogout =
      'You are offline, unable to logout, please try again later.';

  /// Error for signup attempt when offline.
  static const String youAreOfflineUnableToSignUp =
      'You are offline, unable to sign up, please try again later.';

  /// Error for missing URL configuration.
  static const String noUrlConfigured =
      'No URL configured. Please set URL first.';
}
