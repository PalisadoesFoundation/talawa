import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';

part 'chat_list_tile_data_model.g.dart';

@JsonSerializable()

/// This class creates JSON code using the JsonSerializable package.
class ChatListTileDataModel {
  ChatListTileDataModel(
    this.users,
    this.id,
  );

  // Connect the generated [_$ChatListTileDataModelFromJson] function to the `fromJson`
  // factory.
  factory ChatListTileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListTileDataModelFromJson(json);

  /// Converts this [ChatListTileDataModel] instance to a JSON map using the generated function.
  ///
  /// This method is typically used for serializing the model to be sent over a network or saved locally.
  ///
  /// **params**: none
  Map<String, dynamic> toJson() => _$ChatListTileDataModelToJson(this);

  /// The list of users participating in the chat, represented as [ChatUser] objects.
  List<ChatUser>? users;

  /// The unique identifier for the chat, used to distinguish between different chat sessions.
  String? id;
}
