import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('ChatListTileDataModel', () {
    late List<ChatUser> sampleUsers;
    late Chat sampleChat;

    setUp(() {
      sampleUsers = [
        ChatUser(
          id: 'user1',
          firstName: 'John',
          image: 'avatar1.jpg',
        ),
        ChatUser(
          id: 'user2',
          firstName: 'Jane',
          image: 'avatar2.jpg',
        ),
      ];

      sampleChat = Chat(
        id: 'chat123',
        name: 'Test Chat',
        description: 'A test chat room',
        members: sampleUsers,
      );
    });

    test('constructor initializes all fields correctly', () {
      final model = ChatListTileDataModel(
        users: sampleUsers,
        id: 'chat123',
        chat: sampleChat,
      );

      expect(model.users, equals(sampleUsers));
      expect(model.id, equals('chat123'));
      expect(model.chat, equals(sampleChat));
    });

    test('constructor with null values', () {
      final model = ChatListTileDataModel();

      expect(model.users, isNull);
      expect(model.id, isNull);
      expect(model.chat, isNull);
    });

    test('fromChat factory constructor creates correct instance', () {
      final model = ChatListTileDataModel.fromChat(sampleChat);

      expect(model.id, equals(sampleChat.id));
      expect(model.chat, equals(sampleChat));
      expect(model.users, equals(sampleChat.members));
    });

    test('fromChat factory preserves all chat data', () {
      final chatWithDetails = Chat(
        id: 'detailed_chat',
        name: 'Detailed Chat',
        description: 'A chat with full details',
        createdAt: '2023-01-01T00:00:00Z',
        updatedAt: '2023-01-02T00:00:00Z',
        members: sampleUsers,
      );

      final model = ChatListTileDataModel.fromChat(chatWithDetails);

      expect(model.id, equals('detailed_chat'));
      expect(model.chat?.name, equals('Detailed Chat'));
      expect(model.chat?.description, equals('A chat with full details'));
      expect(model.chat?.createdAt, equals('2023-01-01T00:00:00Z'));
      expect(model.chat?.updatedAt, equals('2023-01-02T00:00:00Z'));
      expect(model.users, equals(sampleUsers));
    });

    test('fromChat with empty members list', () {
      final chatWithNoMembers = Chat(
        id: 'empty_chat',
        name: 'Empty Chat',
        members: [],
      );

      final model = ChatListTileDataModel.fromChat(chatWithNoMembers);

      expect(model.id, equals('empty_chat'));
      expect(model.users, isEmpty);
      expect(model.chat?.members, isEmpty);
    });

    test('fromChat with null members', () {
      final chatWithNullMembers = Chat(
        id: 'null_members_chat',
        name: 'Null Members Chat',
        members: null,
      );

      final model = ChatListTileDataModel.fromChat(chatWithNullMembers);

      expect(model.id, equals('null_members_chat'));
      expect(model.users, isNull);
      expect(model.chat?.members, isNull);
    });
  });
}
