// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';

final chatUserOne =
    ChatUser(firstName: 'Ravidi', id: '1', image: "https://testimg.com");
final chatUserTwo =
    ChatUser(firstName: 'Sheikh', id: '2', image: "https://testimg.com");
void main() {
  group("Tests for ChatMessage.dart", () {
    test('check if ChatMessage JSON serialization works', () {
      final message =
          ChatMessage('1', chatUserOne, 'Hello, how are you?', chatUserTwo);

      final messageJson = message.toJson();

      final messageFromJson = ChatMessage.fromJson(messageJson);

      expect(messageFromJson.id, message.id);
      expect(messageFromJson.sender!.firstName, message.sender!.firstName);
      expect(messageFromJson.receiver!.id, message.receiver!.id);
      expect(messageFromJson.messageContent, message.messageContent);
    });
  });
}
