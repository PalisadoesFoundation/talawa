import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('Test ChatListTileDataModel', () {
    test('Test ChatListTileDataModel.fromJson', () {
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

      final ChatListTileDataModel chatListTileDataModelFromJson =
          ChatListTileDataModel.fromJson(json);

      expect(chatListTileDataModel.id, chatListTileDataModelFromJson.id);
      for (int index = 0; index < listLength; index++) {
        expect(chatListTileDataModel.users?[index].id,
            chatListTileDataModelFromJson.users?[index].id);
        expect(chatListTileDataModel.users?[index].firstName,
            chatListTileDataModelFromJson.users?[index].firstName);
        expect(chatListTileDataModel.users?[index].image,
            chatListTileDataModelFromJson.users?[index].image);
      }
    });
  });
}
