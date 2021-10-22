/// Importing files need for this file chat_list_tile_data_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_message.dart'; 
import 'package:talawa/models/chats/chat_user.dart';


/// The Keyword part allow you to split code into separate
/// files in a library
/// chat_list_tile_data_model.g.dart' will be split and its private members 
/// are accessible for all code within files 
part 'chat_list_tile_data_model.g.dart'; 

/// This is  a kind of data format that encodes an object into a string. 
/// This kind of data can be easily translated between server and browser, and server to server. 
/// Serialization is a process that converts an object into the same string. 
@JsonSerializable() 

class ChatListTileDataModel {
 
  /// Indicating three instance of the class ChatListTileDataModelsender, lastMessage and unreadCount 
  /// @attributes
  /// sender : String -> The person who first sends of the message
  /// lastMessage : String -> The final input entered by the sender
  /// unreadCount : Integer - > The number of unread messages 
  ChatListTileDataModel(this.sender, this.lastMessage, this.unreadCount); 


  /// Connect the generated [ _$ChatListTileDataModelFromJson] function to the fromJson  factory. 
  factory ChatListTileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListTileDataModelFromJson(json);

  /// Connect the generated [_$ChatListTileDataModelToJson ]function to the  toJson method 
  Map<String, dynamic> toJson() => _$ChatListTileDataModelToJson(this);

  ChatUser? sender;
  ChatMessage? lastMessage;
  int? unreadCount;
} 

