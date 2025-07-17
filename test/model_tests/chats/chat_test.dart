import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('Chat', () {
    late ChatUser sampleUser1;
    late ChatUser sampleUser2;
    late ChatMessage sampleMessage1;
    late ChatMessage sampleMessage2;
    late List<ChatUser> sampleMembers;
    late List<ChatMessage> sampleMessages;

    setUp(() {
      sampleUser1 = ChatUser(
        id: 'user1',
        firstName: 'John',
        image: 'avatar1.jpg',
      );

      sampleUser2 = ChatUser(
        id: 'user2',
        firstName: 'Jane',
        image: 'avatar2.jpg',
      );

      sampleMembers = [sampleUser1, sampleUser2];

      sampleMessage1 = ChatMessage(
        id: 'msg1',
        body: 'Hello World',
        creator: sampleUser1,
        chatId: 'chat1',
        createdAt: '2023-01-01T10:00:00Z',
      );

      sampleMessage2 = ChatMessage(
        id: 'msg2',
        body: 'Hi there!',
        creator: sampleUser2,
        chatId: 'chat1',
        createdAt: '2023-01-01T10:05:00Z',
      );

      sampleMessages = [sampleMessage1, sampleMessage2];
    });

    test('constructor initializes all fields correctly', () {
      final chat = Chat(
        id: 'chat1',
        name: 'Test Chat',
        description: 'A test chat room',
        createdAt: '2023-01-01T00:00:00Z',
        updatedAt: '2023-01-01T12:00:00Z',
        members: sampleMembers,
        messages: sampleMessages,
      );

      expect(chat.id, equals('chat1'));
      expect(chat.name, equals('Test Chat'));
      expect(chat.description, equals('A test chat room'));
      expect(chat.createdAt, equals('2023-01-01T00:00:00Z'));
      expect(chat.updatedAt, equals('2023-01-01T12:00:00Z'));
      expect(chat.members, equals(sampleMembers));
      expect(chat.messages, equals(sampleMessages));
    });

    test('constructor with null values', () {
      final chat = Chat();

      expect(chat.id, isNull);
      expect(chat.name, isNull);
      expect(chat.description, isNull);
      expect(chat.createdAt, isNull);
      expect(chat.updatedAt, isNull);
      expect(chat.members, isNull);
      expect(chat.messages, isNull);
    });

    test('fromJson creates correct instance with basic fields', () {
      final json = {
        'id': 'chat1',
        'name': 'Test Chat',
        'description': 'A test chat room',
        'createdAt': '2023-01-01T00:00:00Z',
        'updatedAt': '2023-01-01T12:00:00Z',
      };

      final chat = Chat.fromJson(json);

      expect(chat.id, equals('chat1'));
      expect(chat.name, equals('Test Chat'));
      expect(chat.description, equals('A test chat room'));
      expect(chat.createdAt, equals('2023-01-01T00:00:00Z'));
      expect(chat.updatedAt, equals('2023-01-01T12:00:00Z'));
      expect(chat.members, isNull);
      expect(chat.messages, isNull);
    });

    test('fromJson parses members from GraphQL edges format', () {
      final json = {
        'id': 'chat1',
        'name': 'Test Chat',
        'members': {
          'edges': [
            {
              'node': {
                'id': 'user1',
                'name': 'John Doe',
                'avatarURL': 'avatar1.jpg',
              },
            },
            {
              'node': {
                'id': 'user2',
                'name': 'Jane Smith',
                'avatarURL': 'avatar2.jpg',
              },
            },
          ],
        },
      };

      final chat = Chat.fromJson(json);

      expect(chat.members, isNotNull);
      expect(chat.members!.length, equals(2));
      expect(chat.members![0].id, equals('user1'));
      expect(chat.members![0].firstName, equals('John'));
      expect(chat.members![0].image, equals('avatar1.jpg'));
      expect(chat.members![1].id, equals('user2'));
      expect(chat.members![1].firstName, equals('Jane'));
      expect(chat.members![1].image, equals('avatar2.jpg'));
    });

    test('fromJson parses members from simple list format', () {
      final json = {
        'id': 'chat1',
        'name': 'Test Chat',
        'members': [
          {
            'id': 'user1',
            'name': 'John Doe',
            'avatarURL': 'avatar1.jpg',
          },
          {
            'id': 'user2',
            'name': 'Jane Smith',
            'avatarURL': 'avatar2.jpg',
          },
        ],
      };

      final chat = Chat.fromJson(json);

      expect(chat.members, isNotNull);
      expect(chat.members!.length, equals(2));
      expect(chat.members![0].id, equals('user1'));
      expect(chat.members![0].firstName, equals('John'));
      expect(chat.members![1].id, equals('user2'));
      expect(chat.members![1].firstName, equals('Jane'));
    });

    test('fromJson parses messages from GraphQL edges format', () {
      final json = {
        'id': 'chat1',
        'name': 'Test Chat',
        'messages': {
          'edges': [
            {
              'node': {
                'id': 'msg1',
                'body': 'Hello World',
                'createdAt': '2023-01-01T10:00:00Z',
                'creator': {
                  'id': 'user1',
                  'name': 'John Doe',
                  'avatarURL': 'avatar1.jpg',
                },
              },
            },
            {
              'node': {
                'id': 'msg2',
                'body': 'Hi there!',
                'createdAt': '2023-01-01T10:05:00Z',
                'creator': {
                  'id': 'user2',
                  'name': 'Jane Smith',
                  'avatarURL': 'avatar2.jpg',
                },
              },
            },
          ],
        },
      };

      final chat = Chat.fromJson(json);

      expect(chat.messages, isNotNull);
      expect(chat.messages!.length, equals(2));
      expect(chat.messages![0].id, equals('msg1'));
      expect(chat.messages![0].body, equals('Hello World'));
      expect(chat.messages![0].creator?.id, equals('user1'));
      expect(chat.messages![1].id, equals('msg2'));
      expect(chat.messages![1].body, equals('Hi there!'));
      expect(chat.messages![1].creator?.id, equals('user2'));
    });

    test('fromJson parses messages from simple list format', () {
      final json = {
        'id': 'chat1',
        'name': 'Test Chat',
        'messages': [
          {
            'id': 'msg1',
            'body': 'Hello World',
            'createdAt': '2023-01-01T10:00:00Z',
            'creator': {
              'id': 'user1',
              'name': 'John Doe',
              'avatarURL': 'avatar1.jpg',
            },
          },
        ],
      };

      final chat = Chat.fromJson(json);

      expect(chat.messages, isNotNull);
      expect(chat.messages!.length, equals(1));
      expect(chat.messages![0].id, equals('msg1'));
      expect(chat.messages![0].body, equals('Hello World'));
      expect(chat.messages![0].creator?.id, equals('user1'));
    });

    test('fromJson handles null members and messages', () {
      final json = {
        'id': 'chat1',
        'name': 'Test Chat',
        'members': null,
        'messages': null,
      };

      final chat = Chat.fromJson(json);

      expect(chat.id, equals('chat1'));
      expect(chat.name, equals('Test Chat'));
      expect(chat.members, isNull);
      expect(chat.messages, isNull);
    });

    test('fromJson handles empty JSON', () {
      final json = <String, dynamic>{};

      final chat = Chat.fromJson(json);

      expect(chat.id, isNull);
      expect(chat.name, isNull);
      expect(chat.description, isNull);
      expect(chat.createdAt, isNull);
      expect(chat.updatedAt, isNull);
      expect(chat.members, isNull);
      expect(chat.messages, isNull);
    });

    test('toJson creates correct JSON with all fields', () {
      final chat = Chat(
        id: 'chat1',
        name: 'Test Chat',
        description: 'A test chat room',
        createdAt: '2023-01-01T00:00:00Z',
        updatedAt: '2023-01-01T12:00:00Z',
        members: sampleMembers,
        messages: sampleMessages,
      );

      final json = chat.toJson();

      expect(json['id'], equals('chat1'));
      expect(json['name'], equals('Test Chat'));
      expect(json['description'], equals('A test chat room'));
      expect(json['createdAt'], equals('2023-01-01T00:00:00Z'));
      expect(json['updatedAt'], equals('2023-01-01T12:00:00Z'));
      expect(json['members'], isA<List>());
      expect((json['members'] as List).length, equals(2));
      expect(json['messages'], isA<List>());
      expect((json['messages'] as List).length, equals(2));
    });

    test('toJson handles null members and messages', () {
      final chat = Chat(
        id: 'chat1',
        name: 'Test Chat',
        members: null,
        messages: null,
      );

      final json = chat.toJson();

      expect(json['id'], equals('chat1'));
      expect(json['name'], equals('Test Chat'));
      expect(json['members'], isNull);
      expect(json['messages'], isNull);
    });

    test('toJson handles empty members and messages lists', () {
      final chat = Chat(
        id: 'chat1',
        name: 'Test Chat',
        members: [],
        messages: [],
      );

      final json = chat.toJson();

      expect(json['id'], equals('chat1'));
      expect(json['name'], equals('Test Chat'));
      expect(json['members'], isA<List>());
      expect((json['members'] as List).isEmpty, isTrue);
      expect(json['messages'], isA<List>());
      expect((json['messages'] as List).isEmpty, isTrue);
    });

    test('fromJson and toJson roundtrip maintains data integrity', () {
      final originalJson = {
        'id': 'chat1',
        'name': 'Test Chat',
        'description': 'A test chat room',
        'createdAt': '2023-01-01T00:00:00Z',
        'updatedAt': '2023-01-01T12:00:00Z',
        'members': [
          {
            'id': 'user1',
            'name': 'John Doe',
            'avatarURL': 'avatar1.jpg',
          },
        ],
        'messages': [
          {
            'id': 'msg1',
            'body': 'Hello World',
            'createdAt': '2023-01-01T10:00:00Z',
            'creator': {
              'id': 'user1',
              'name': 'John Doe',
              'avatarURL': 'avatar1.jpg',
            },
          },
        ],
      };

      final chat = Chat.fromJson(originalJson);
      final regeneratedJson = chat.toJson();

      expect(regeneratedJson['id'], equals(originalJson['id']));
      expect(regeneratedJson['name'], equals(originalJson['name']));
      expect(
          regeneratedJson['description'], equals(originalJson['description']));
      expect(regeneratedJson['createdAt'], equals(originalJson['createdAt']));
      expect(regeneratedJson['updatedAt'], equals(originalJson['updatedAt']));
    });
  });
}
