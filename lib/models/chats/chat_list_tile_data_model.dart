// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';

part 'chat_list_tile_data_model.g.dart';

@JsonSerializable()

/// This class creates JSON code using the JsonSerializable package.
class ChatListTileDataModel {
  ChatListTileDataModel(this.users, this.id);

  // Connect the generated [_$ChatListTileDataModelFromJson] function to the `fromJson`
  // factory.
  factory ChatListTileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListTileDataModelFromJson(json);

  // Connect the generated [_$ChatListTileDataModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChatListTileDataModelToJson(this);

  List<ChatUser>? users;
  String? id;
}
