import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

final chatUserOne =
    ChatUser(firstName: 'Satyam', id: '1', image: "https://testimg.com");
final chatUserTwo =
    ChatUser(firstName: 'Harsh', id: '2', image: "https://testimg.com");

class MockUserConfig extends Mock implements UserConfig {}

void main() {
  setUpAll(() {
    testSetupLocator();
  });

  group("Tests for ChatMessage.dart", () {
    test('check if ChatMessage constructor works with named parameters', () {
      final message = ChatMessage(
        id: '1',
        sender: chatUserOne,
        messageContent: 'Hello, how are you?',
        receiver: chatUserTwo,
        createdAt: '2023-01-01T00:00:00Z',
        updatedAt: '2023-01-01T00:00:00Z',
      );

      expect(message.id, '1');
      expect(message.sender?.firstName, 'Satyam');
      expect(message.receiver?.id, '2');
      expect(message.messageContent, 'Hello, how are you?');
      expect(message.createdAt, '2023-01-01T00:00:00Z');
      expect(message.updatedAt, '2023-01-01T00:00:00Z');
    });

    test('check if ChatMessage toJson works correctly', () {
      final message = ChatMessage(
        id: '1',
        sender: chatUserOne,
        messageContent: 'Hello, how are you?',
        receiver: chatUserTwo,
        createdAt: '2023-01-01T00:00:00Z',
        updatedAt: '2023-01-01T00:00:00Z',
      );

      final messageJson = message.toJson();

      expect(messageJson['id'], '1');
      expect(messageJson['messageContent'], 'Hello, how are you?');
      expect(messageJson['createdAt'], '2023-01-01T00:00:00Z');
      expect(messageJson['updatedAt'], '2023-01-01T00:00:00Z');
      expect(messageJson['sender'], isA<Map<String, dynamic>>());
      expect(messageJson['receiver'], isA<Map<String, dynamic>>());
    });

    test('check if ChatMessage fromJson works for current user as sender', () {
      // Mock the current user
      final mockUserConfig = getAndRegisterUserConfig();
      when(mockUserConfig.currentUser).thenReturn(
        User(
          id: '1',
          firstName: 'Satyam',
          image: 'https://testimg.com',
        ),
      );

      final json = {
        'id': 'msg1',
        'body': 'Hello from me!',
        'creator': {
          'id': '1',
          'name': 'Satyam Jha',
        },
        'createdAt': '2023-01-01T00:00:00Z',
        'updatedAt': '2023-01-01T00:00:00Z',
      };

      final receiverUser = ChatUser(firstName: 'Harsh', id: '2');
      final message = ChatMessage.fromJson(
        json,
        currentUserId: '1',
        currentUserFirstName: 'Satyam',
        currentUserImage: 'https://testimg.com',
        receiverUser: receiverUser,
      );

      expect(message.id, 'msg1');
      expect(message.messageContent, 'Hello from me!');
      expect(message.sender?.id, '1');
      expect(message.sender?.firstName, 'Satyam');
      expect(message.receiver?.id, '2');
      expect(message.createdAt, '2023-01-01T00:00:00Z');
      expect(message.updatedAt, '2023-01-01T00:00:00Z');
    });

    test('check if ChatMessage fromJson works for other user as sender', () {
      // Mock the current user
      final mockUserConfig = getAndRegisterUserConfig();
      when(mockUserConfig.currentUser).thenReturn(
        User(
          id: '2',
          firstName: 'Harsh',
          image: 'https://testimg.com',
        ),
      );

      final json = {
        'id': 'msg2',
        'body': 'Hello from someone else!',
        'creator': {
          'id': '1',
          'name': 'Satyam Jha',
        },
        'createdAt': '2023-01-01T00:00:00Z',
        'updatedAt': '2023-01-01T00:00:00Z',
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '2',
        currentUserFirstName: 'Harsh',
        currentUserImage: 'https://testimg.com',
      );

      expect(message.id, 'msg2');
      expect(message.messageContent, 'Hello from someone else!');
      expect(message.sender?.id, '1');
      expect(message.sender?.firstName, 'Satyam');
      expect(message.receiver?.id, '2'); // Current user becomes receiver
      expect(message.receiver?.firstName, 'Harsh');
      expect(message.createdAt, '2023-01-01T00:00:00Z');
      expect(message.updatedAt, '2023-01-01T00:00:00Z');
    });

    test('check if ChatMessage fromJson handles missing creator', () {
      // Mock the current user
      final mockUserConfig = getAndRegisterUserConfig();
      when(mockUserConfig.currentUser).thenReturn(
        User(
          id: '1',
          firstName: 'Test User',
          image: 'https://testimg.com',
        ),
      );

      final json = {
        'id': 'msg3',
        'body': 'Message with no creator',
        'createdAt': '2023-01-01T00:00:00Z',
        'updatedAt': '2023-01-01T00:00:00Z',
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '1',
        currentUserFirstName: 'Test User',
        currentUserImage: 'https://testimg.com',
      );

      expect(message.id, 'msg3');
      expect(message.messageContent, 'Message with no creator');
      expect(message.sender, isNull);
      expect(message.createdAt, '2023-01-01T00:00:00Z');
      expect(message.updatedAt, '2023-01-01T00:00:00Z');
    });

    test('check if _parseCreator works with creator field', () {
      final json = {
        'creator': {
          'id': '1',
          'name': 'John Doe',
        },
        'sender': {
          'id': '2',
          'name': 'Jane Smith',
        },
      };

      // Access the private method through fromJson to test it indirectly
      final message = ChatMessage.fromJson(
        json,
        currentUserId: '3',
        currentUserFirstName: 'Test User',
      );

      // The creator should be parsed from 'creator' field (priority 1)
      expect(message.sender?.id, '1');
      expect(message.sender?.firstName, 'John');
    });

    test('check if _parseCreator works with sender field when creator is null',
        () {
      final json = {
        'creator': null,
        'sender': {
          'id': '2',
          'name': 'Jane Smith',
        },
        'receiver': {
          'id': '3',
          'name': 'Bob Johnson',
        },
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '4',
        currentUserFirstName: 'Test User',
      );

      // Should parse from 'sender' field (priority 2)
      expect(message.sender?.id, '2');
      expect(message.sender?.firstName, 'Jane');
    });

    test(
        'check if _parseCreator works with receiver field when creator and sender are null',
        () {
      final json = {
        'creator': null,
        'sender': null,
        'receiver': {
          'id': '3',
          'name': 'Bob Johnson',
        },
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '4',
        currentUserFirstName: 'Test User',
      );

      // Should parse from 'receiver' field (priority 3)
      expect(message.sender?.id, '3');
      expect(message.sender?.firstName, 'Bob');
    });

    test('check if _parseCreator returns null when all fields are missing', () {
      final json = {
        'id': 'msg1',
        'body': 'Test message',
        // No creator, sender, or receiver fields
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '1',
        currentUserFirstName: 'Test User',
      );

      // Should return null when no creator info is available
      expect(message.sender, isNull);
    });

    test('check if _parseCreator handles empty fields correctly', () {
      final json = {
        'creator': {},
        'sender': {
          'id': '2',
          'name': 'Jane Smith',
        },
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '3',
        currentUserFirstName: 'Test User',
      );

      // Should handle empty creator object and fall back to sender
      expect(message.sender?.id, '2');
      expect(message.sender?.firstName, 'Jane');
    });

    test('_parseCreator field priority order', () {
      final json = {
        'creator': {
          'id': '1',
          'name': 'Creator User',
        },
        'sender': {
          'id': '2',
          'name': 'Sender User',
        },
        'receiver': {
          'id': '3',
          'name': 'Receiver User',
        },
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '4',
        currentUserFirstName: 'Test User',
      );

      // Should prioritize 'creator' over 'sender' and 'receiver'
      expect(message.sender?.id, '1');
      expect(message.sender?.firstName, 'Creator');
    });

    test('check if _parseCreator handles ChatUser.fromJson exception', () {
      final json = {
        'creator': {
          'invalidField':
              'invalid data', // This will cause ChatUser.fromJson to fail
        },
        'receiver': {
          'id': '3',
          'name': 'Bob Johnson',
        },
      };

      final message = ChatMessage.fromJson(
        json,
        currentUserId: '4',
        currentUserFirstName: 'Test User',
      );

      // Should fall back to receiver when creator parsing fails
      expect(message.sender?.id, '3');
      expect(message.sender?.firstName, 'Bob');
    });
  });
}
