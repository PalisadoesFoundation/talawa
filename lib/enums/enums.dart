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
@HiveType(typeId: 9)
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

/// Represents the actions available in group chat popup menu.
enum GroupChatAction {
  /// Show group information.
  info,

  /// Edit group details (admin only).
  edit,

  /// Add new members to group (admin only).
  addMembers,

  /// Manage existing group members (admin only).
  manageMembers,

  /// Delete the group (admin only).
  delete,

  /// Leave the group (non-admin only).
  leave,
}

@HiveType(typeId: 13)

/// VoteType enum represents the different types of votes a user can cast.
enum VoteType {
  /// Upvote - positive vote.
  @HiveField(0)
  upVote,

  /// Downvote - negative vote.
  @HiveField(1)
  downVote,

  /// No vote (neutral).
  @HiveField(2)
  none;

  /// Converts the enum value to a string representation for backend API.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The string representation of the VoteType for API.
  String toApiString() {
    switch (this) {
      case VoteType.upVote:
        return 'up_vote';
      case VoteType.downVote:
        return 'down_vote';
      case VoteType.none:
        return 'null';
    }
  }

  /// Converts a string from the API to the corresponding VoteType enum.
  ///
  /// **params**:
  /// * `apiString`: The string representation of the VoteType from API.
  ///
  /// **returns**:
  /// * `VoteType`: The corresponding VoteType enum value.
  static VoteType fromApiString(String? apiString) {
    if (apiString == null) return VoteType.none;

    switch (apiString) {
      case 'up_vote':
        return VoteType.upVote;
      case 'down_vote':
        return VoteType.downVote;
      default:
        return VoteType.none;
    }
  }
}
