// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('Test ChatListTileDataModel', () {
    const int listLength = 4;

    final List<ChatUser> users = List.generate(listLength, (index) {
      return ChatUser(
        id: '$index',
        firstName: 'First$index',
        image: 'Image$index',
      );
    });

    final ChatListTileDataModel chatListTileDataModel = ChatListTileDataModel(
      users,
      '123',
    );

    final Map<String, dynamic> json = {
      '_id': '123',
      'users': List.generate(listLength, (index) {
        return {
          '_id': '$index',
          'firstName': 'First$index',
          'image': 'Image$index',
        };
      }),
    };

    void checkUsers(List<ChatUser>? users1, List<ChatUser>? users2) {
      if (users1 == null || users2 == null) {
        expect(users1, users2);
        return;
      }

      for (int index = 0; index < users1.length; index++) {
        expect(users1[index].id, users2[index].id);
        expect(users1[index].firstName, users2[index].firstName);
        expect(users1[index].image, users2[index].image);
      }
    }

    test('Test constructor', () {
      expect(chatListTileDataModel.id, '123');
      checkUsers(chatListTileDataModel.users, users);
    });

    test('Test ChatListTileDataModel.fromJson', () {
      final ChatListTileDataModel chatListTileDataModelFromJson =
          ChatListTileDataModel.fromJson(json);

      expect(chatListTileDataModel.id, chatListTileDataModelFromJson.id);
      checkUsers(
        chatListTileDataModel.users,
        chatListTileDataModelFromJson.users,
      );
    });

    test('Test toJson', () {
      final Map<String, dynamic> json = chatListTileDataModel.toJson();

      expect(json['_id'], chatListTileDataModel.id);
      checkUsers(json['users'] as List<ChatUser>, chatListTileDataModel.users);
    });
  });
}
