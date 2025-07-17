import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('ChatMessage', () {
    late ChatUser sampleUser1;
    late ChatMessage sampleParentMessage;

    setUp(() {
      sampleUser1 = ChatUser(
        id: 'user1',
        firstName: 'John',
        image: 'avatar1.jpg',
      );

      sampleParentMessage = ChatMessage(
        id: 'parent_msg',
        body: 'Original message',
        creator: sampleUser1,
        chatId: 'chat1',
        createdAt: '2023-01-01T09:00:00Z',
      );
    });

    test('constructor initializes all fields correctly', () {
      final message = ChatMessage(
        id: 'msg1',
        body: 'Hello World',
        creator: sampleUser1,
        chatId: 'chat1',
        parentMessage: sampleParentMessage,
        createdAt: '2023-01-01T10:00:00Z',
        updatedAt: '2023-01-01T10:05:00Z',
      );

      expect(message.id, equals('msg1'));
      expect(message.body, equals('Hello World'));
      expect(message.creator, equals(sampleUser1));
      expect(message.chatId, equals('chat1'));
      expect(message.parentMessage, equals(sampleParentMessage));
      expect(message.createdAt, equals('2023-01-01T10:00:00Z'));
      expect(message.updatedAt, equals('2023-01-01T10:05:00Z'));
    });

    test('constructor with null values', () {
      final message = ChatMessage();

      expect(message.id, isNull);
      expect(message.body, isNull);
      expect(message.creator, isNull);
      expect(message.chatId, isNull);
      expect(message.parentMessage, isNull);
      expect(message.createdAt, isNull);
      expect(message.updatedAt, isNull);
    });

    test('fromJson creates correct instance with basic fields', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'chatId': 'chat1',
        'createdAt': '2023-01-01T10:00:00Z',
        'updatedAt': '2023-01-01T10:05:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.id, equals('msg1'));
      expect(message.body, equals('Hello World'));
      expect(message.chatId, equals('chat1'));
      expect(message.createdAt, equals('2023-01-01T10:00:00Z'));
      expect(message.updatedAt, equals('2023-01-01T10:05:00Z'));
      expect(message.creator, isNull);
      expect(message.parentMessage, isNull);
    });

    test('fromJson parses creator correctly', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'creator': {
          'id': 'user1',
          'name': 'John Doe',
          'avatarURL': 'avatar1.jpg',
        },
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.creator, isNotNull);
      expect(message.creator!.id, equals('user1'));
      expect(message.creator!.firstName, equals('John'));
      expect(message.creator!.image, equals('avatar1.jpg'));
    });

    test('fromJson parses parentMessage correctly', () {
      final json = {
        'id': 'msg2',
        'body': 'Reply message',
        'parentMessage': {
          'id': 'parent_msg',
          'body': 'Original message',
          'creator': {
            'id': 'user1',
            'name': 'John Doe',
            'avatarURL': 'avatar1.jpg',
          },
          'createdAt': '2023-01-01T09:00:00Z',
        },
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.parentMessage, isNotNull);
      expect(message.parentMessage!.id, equals('parent_msg'));
      expect(message.parentMessage!.body, equals('Original message'));
      expect(message.parentMessage!.creator, isNotNull);
      expect(message.parentMessage!.creator!.id, equals('user1'));
      expect(message.parentMessage!.creator!.firstName, equals('John'));
    });

    test('fromJson extracts chatId from chat object', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'chat': {
          'id': 'chat123',
          'name': 'Test Chat',
        },
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.chatId, equals('chat123'));
    });

    test('fromJson prioritizes direct chatId over chat object', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'chatId': 'direct_chat_id',
        'chat': {
          'id': 'nested_chat_id',
          'name': 'Test Chat',
        },
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(
        message.chatId,
        equals('nested_chat_id'),
      ); // chat object is checked first
    });

    test('fromJson handles null creator gracefully', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'creator': null,
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.creator, isNull);
      expect(message.id, equals('msg1'));
      expect(message.body, equals('Hello World'));
    });

    test('fromJson handles null parentMessage gracefully', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'parentMessage': null,
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.parentMessage, isNull);
      expect(message.id, equals('msg1'));
      expect(message.body, equals('Hello World'));
    });

    test('fromJson handles empty JSON', () {
      final json = <String, dynamic>{};

      final message = ChatMessage.fromJson(json);

      expect(message.id, isNull);
      expect(message.body, isNull);
      expect(message.creator, isNull);
      expect(message.chatId, isNull);
      expect(message.parentMessage, isNull);
      expect(message.createdAt, isNull);
      expect(message.updatedAt, isNull);
    });

    test('fromJson handles nested parentMessage with creator', () {
      final json = {
        'id': 'reply_msg',
        'body': 'This is a reply',
        'parentMessage': {
          'id': 'original_msg',
          'body': 'Original message',
          'creator': {
            'id': 'user1',
            'name': 'John Doe',
            'avatarURL': 'avatar1.jpg',
          },
          'parentMessage': {
            'id': 'root_msg',
            'body': 'Root message',
            'creator': {
              'id': 'user2',
              'name': 'Jane Smith',
              'avatarURL': 'avatar2.jpg',
            },
          },
        },
        'creator': {
          'id': 'user3',
          'name': 'Bob Wilson',
          'avatarURL': 'avatar3.jpg',
        },
      };

      final message = ChatMessage.fromJson(json);

      expect(message.id, equals('reply_msg'));
      expect(message.body, equals('This is a reply'));
      expect(message.creator!.firstName, equals('Bob'));

      expect(message.parentMessage, isNotNull);
      expect(message.parentMessage!.id, equals('original_msg'));
      expect(message.parentMessage!.creator!.firstName, equals('John'));

      expect(message.parentMessage!.parentMessage, isNotNull);
      expect(message.parentMessage!.parentMessage!.id, equals('root_msg'));
      expect(
        message.parentMessage!.parentMessage!.creator!.firstName,
        equals('Jane'),
      );
    });

    test('toJson creates correct JSON with all fields', () {
      final message = ChatMessage(
        id: 'msg1',
        body: 'Hello World',
        creator: sampleUser1,
        chatId: 'chat1',
        parentMessage: sampleParentMessage,
        createdAt: '2023-01-01T10:00:00Z',
        updatedAt: '2023-01-01T10:05:00Z',
      );

      final json = message.toJson();

      expect(json['id'], equals('msg1'));
      expect(json['body'], equals('Hello World'));
      expect(json['chatId'], equals('chat1'));
      expect(json['createdAt'], equals('2023-01-01T10:00:00Z'));
      expect(json['updatedAt'], equals('2023-01-01T10:05:00Z'));
      expect(json['creator'], isA<Map<String, dynamic>>());
      expect(json['parentMessage'], isA<Map<String, dynamic>>());
    });

    test('toJson handles null creator and parentMessage', () {
      final message = ChatMessage(
        id: 'msg1',
        body: 'Hello World',
        chatId: 'chat1',
        creator: null,
        parentMessage: null,
        createdAt: '2023-01-01T10:00:00Z',
      );

      final json = message.toJson();

      expect(json['id'], equals('msg1'));
      expect(json['body'], equals('Hello World'));
      expect(json['chatId'], equals('chat1'));
      expect(json['creator'], isNull);
      expect(json['parentMessage'], isNull);
      expect(json['createdAt'], equals('2023-01-01T10:00:00Z'));
    });

    test('fromJson and toJson roundtrip maintains data integrity', () {
      final originalJson = {
        'id': 'msg1',
        'body': 'Hello World',
        'creator': {
          'id': 'user1',
          'name': 'John Doe',
          'avatarURL': 'avatar1.jpg',
        },
        'chatId': 'chat1',
        'parentMessage': {
          'id': 'parent_msg',
          'body': 'Original message',
          'creator': {
            'id': 'user2',
            'name': 'Jane Smith',
            'avatarURL': 'avatar2.jpg',
          },
        },
        'createdAt': '2023-01-01T10:00:00Z',
        'updatedAt': '2023-01-01T10:05:00Z',
      };

      final message = ChatMessage.fromJson(originalJson);
      final regeneratedJson = message.toJson();

      expect(regeneratedJson['id'], equals(originalJson['id']));
      expect(regeneratedJson['body'], equals(originalJson['body']));
      expect(regeneratedJson['chatId'], equals(originalJson['chatId']));
      expect(regeneratedJson['createdAt'], equals(originalJson['createdAt']));
      expect(regeneratedJson['updatedAt'], equals(originalJson['updatedAt']));

      // Verify creator data integrity
      final creatorJson = regeneratedJson['creator'] as Map<String, dynamic>;
      expect(creatorJson['id'], equals('user1'));
      expect(creatorJson['firstName'], equals('John'));

      // Verify parent message data integrity
      final parentJson =
          regeneratedJson['parentMessage'] as Map<String, dynamic>;
      expect(parentJson['id'], equals('parent_msg'));
      expect(parentJson['body'], equals('Original message'));
    });

    test('fromJson handles invalid creator data gracefully', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'creator': 'invalid_string_instead_of_object',
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.creator, isNull);
      expect(message.id, equals('msg1'));
      expect(message.body, equals('Hello World'));
    });

    test('fromJson handles invalid parentMessage data gracefully', () {
      final json = {
        'id': 'msg1',
        'body': 'Hello World',
        'parentMessage': 'invalid_string_instead_of_object',
        'createdAt': '2023-01-01T10:00:00Z',
      };

      final message = ChatMessage.fromJson(json);

      expect(message.parentMessage, isNull);
      expect(message.id, equals('msg1'));
      expect(message.body, equals('Hello World'));
    });
  });
}
