// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:json_annotation/json_annotation.dart';
part 'chat_user.g.dart';

@JsonSerializable()

/// This class creates JSON code for chat user using the JsonSerializable package.
class ChatUser {
  ChatUser({this.firstName, this.id, this.image});

  // Connect the generated [_$ChatUserFromJson] function to the `fromJson`
  // factory.
  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);

  // Connect the generated [_$ChatUserFromJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChatUserToJson(this);

  String? firstName;
  String? id;
  String? image;
}
