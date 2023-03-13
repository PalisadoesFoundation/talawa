// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

///This file contains different enums.
///The enum keyword is used to define an enumeration type in Dart.
/// The use case of enumeration is to store finite data members under the same type definition.

/// Represents the state of the view
enum ViewState {
  idle,
  busy,
}

/// Represents the state of the chat
enum ChatState { initial, loading, complete }

/// Represents the type of the tile
enum TileType { user, org, option }

/// Represents the type of the Message
enum MessageType { error, warning, info, random }

enum CallFor { login, signup, joinPublicOrg }

enum ModalSheet { donation, invite }
