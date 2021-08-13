import 'package:json_annotation/json_annotation.dart';
part 'chat_user.g.dart';

@JsonSerializable()
class ChatUser {
  ChatUser({this.name, this.id, this.image});

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
  Map<String, dynamic> toJson() => _$ChatUserToJson(this);

  String? name;
  String? id;
  String? image;
}
