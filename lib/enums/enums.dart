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
