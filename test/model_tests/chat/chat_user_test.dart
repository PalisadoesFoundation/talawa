// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('Test chat_user model', () {
    final chatUser = ChatUser(
      firstName: 'Ayush',
      id: null,
      image: 'random image url',
    );
    final chatUserJson = {
      'firstName': 'Ayush',
      '_id': null,
      'image': 'random image url',
    };
    test('Test json to model', () {
      final chatUserFromJson = ChatUser.fromJson(chatUserJson);
      expect(chatUser.firstName, chatUserFromJson.firstName);
      expect(chatUser.id, chatUserFromJson.id);
      expect(chatUser.image, chatUserFromJson.image);
    });
    test('Test model to json', () {
      final json = chatUser.toJson();
      expect(json, chatUserJson);
    });
  });
}
