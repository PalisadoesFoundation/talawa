import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';

part 'chat_list_tile_data_model.g.dart';

@JsonSerializable()
class ChatListTileDataModel {
  ChatListTileDataModel(this.sender, this.lastMessage, this.unreadCount);

  factory ChatListTileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListTileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatListTileDataModelToJson(this);

  ChatUser? sender;
  ChatMessage? lastMessage;
  int? unreadCount;
}
