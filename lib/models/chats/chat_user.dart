import 'package:json_annotation/json_annotation.dart';
part 'chat_user.g.dart';

/// A ChatUser object engages in chat messaging and can be encoded into a string.
@JsonSerializable()
class ChatUser {
  /// Returns a new instance of ChatUser class
  ChatUser({this.name, this.id, this.image});

  /// Connects the generated [_$ChatUserFromJson] function to the `fromJson` factory.
  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);

  /// Connects the generated [_$ChatUserToJson] function to the `toJson` method. 
  Map<String, dynamic> toJson() => _$ChatUserToJson(this);

  /// Nullable instance properties
  String? name;
  String? id;
  String? image;
}
