import 'package:hive/hive.dart';

part 'enums.g.dart';

/// Represents the state of the view.
enum ViewState {
  /// The view is not doing anything.
  idle,

  /// The view is loading something.
  busy,
}

/// Represents the state of the chat.
enum ChatState {
  /// The chat is at initial state.
  initial,

  /// The chat is loading something.
  loading,

  /// The chat state is complete.
  complete
}

/// Represents the type of the tile.
enum TileType {
  /// Represents the tile of the user.
  user,

  /// Represents the tile of the attendee.
  attendee,

  /// Represents the tile of the organization.
  org,

  /// Represents the tile of the option.
  option
}

/// Represents the type of the Message.
enum MessageType {
  /// Represents error message.
  error,

  /// Represents warning message.
  warning,

  /// Represents info message.
  info,

  /// Represents random message.
  random
}

/// Represents the type of CallFor.
enum CallFor {
  /// Represents the call for login.
  login,

  /// Represents the call for signup.
  signup,

  /// Represents the call for joining Public organization.
  joinPublicOrg
}

/// Represents the type of ModalSheet.
enum ModalSheet {
  /// Represents the modal sheet for donation.
  donation,

  /// Represents the modal sheet for invite.
  invite
}

/// This enum defines the possible statuses for a cached user action.
///
/// It's used with Hive to store the state of user actions locally.
@HiveType(typeId: 4)
enum CachedUserActionStatus {
  /// The user action is still waiting to be processed.
  @HiveField(0)
  pending,

  /// The user action has been successfully completed.
  @HiveField(1)
  completed,
}

/// This enum defines the different types of cached GraphQL operations.
///
/// It's used with Hive to store information about cached queries and mutations.
@HiveType(typeId: 5)
enum CachedOperationType {
  /// A GraphQL query that requires user authentication.
  @HiveField(0)
  gqlAuthQuery,

  /// A GraphQL mutation that requires user authentication.
  @HiveField(1)
  gqlAuthMutation,

  /// A GraphQL query that does not require user authentication.
  @HiveField(2)
  gqlNonAuthQuery,

  /// A GraphQL mutation that does not require user authentication.
  @HiveField(3)
  gqlNonAuthMutation,
}

/// Enum representing the types of actions that can be performed.
enum ActionType {
  /// A critical action that requires immediate attention and cannot be delayed.
  critical,

  /// An optimistic action that can be performed with the assumption that it will succeed.
  ///
  /// even if the result is not immediately confirmed.
  optimistic,
}
