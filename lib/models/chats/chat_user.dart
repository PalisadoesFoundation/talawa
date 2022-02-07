import 'package:json_annotation/json_annotation.dart';
part 'chat_user.g.dart';

@JsonSerializable()
class ChatUser {
  ChatUser({this.firstName, this.id, this.image});

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
  Map<String, dynamic> toJson() => _$ChatUserToJson(this);

  String? firstName;
  String? id;
  String? image;
}
