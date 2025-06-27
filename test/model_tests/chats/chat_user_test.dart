import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('Test chat_user model', () {
    test('Test ChatUser constructor with named parameters', () {
      final chatUser = ChatUser(
        firstName: 'Ayush',
        id: 'user123',
        image: 'random image url',
      );

      expect(chatUser.firstName, 'Ayush');
      expect(chatUser.id, 'user123');
      expect(chatUser.image, 'random image url');
    });

    test('Test ChatUser toJson method', () {
      final chatUser = ChatUser(
        firstName: 'Ayush',
        id: 'user123',
        image: 'random image url',
      );

      final json = chatUser.toJson();
      final expectedJson = {
        'firstName': 'Ayush',
        'id': 'user123',
        'avatarURL': 'random image url',
      };

      expect(json, expectedJson);
    });

    test('Test ChatUser.fromJson with old format (firstName field)', () {
      final chatUserJson = {
        'firstName': 'Ayush',
        'id': 'user123',
        'avatarURL': 'random image url',
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(chatUserFromJson.firstName, 'Ayush');
      expect(chatUserFromJson.id, 'user123');
      expect(chatUserFromJson.image, 'random image url');
    });

    test('Test ChatUser.fromJson with new PostgreSQL format (name field)', () {
      final chatUserJson = {
        'name': 'Ayush Kumar Sharma',
        'id': 'user123',
        'avatarURL': 'https://example.com/avatar.jpg',
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(chatUserFromJson.firstName, 'Ayush'); // Should extract first name
      expect(chatUserFromJson.id, 'user123');
      expect(
        chatUserFromJson.image,
        'https://example.com/avatar.jpg',
      ); // Should map avatarURL to image
    });

    test('Test ChatUser.fromJson with single name', () {
      final chatUserJson = {
        'name': 'Ayush',
        'id': 'user123',
        'avatarURL': 'https://example.com/avatar.jpg',
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(chatUserFromJson.firstName, 'Ayush');
      expect(chatUserFromJson.id, 'user123');
      expect(chatUserFromJson.image, 'https://example.com/avatar.jpg');
    });

    test('Test ChatUser.fromJson with empty name', () {
      final chatUserJson = {
        'name': '',
        'id': 'user123',
        'avatarURL': 'https://example.com/avatar.jpg',
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(
        chatUserFromJson.firstName,
        null,
      ); // Empty name should result in null firstName
      expect(chatUserFromJson.id, 'user123');
      expect(chatUserFromJson.image, 'https://example.com/avatar.jpg');
    });

    test('Test ChatUser.fromJson with null values', () {
      final chatUserJson = {
        'name': null,
        'id': null,
        'avatarURL': null,
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(chatUserFromJson.firstName, null);
      expect(chatUserFromJson.id, null);
      expect(chatUserFromJson.image, null);
    });

    test('Test ChatUser.fromJson with missing avatarURL', () {
      final chatUserJson = {
        'firstName': 'Ayush',
        'id': 'user123',
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(chatUserFromJson.firstName, 'Ayush');
      expect(chatUserFromJson.id, 'user123');
      expect(
        chatUserFromJson.image,
        null,
      ); // Should be null when avatarURL is missing
    });

    test('Test ChatUser.fromJson with null avatarURL', () {
      final chatUserJson = {
        'firstName': 'Ayush',
        'id': 'user123',
        'avatarURL': null,
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(chatUserFromJson.firstName, 'Ayush');
      expect(chatUserFromJson.id, 'user123');
      expect(
        chatUserFromJson.image,
        null,
      ); // Should be null when avatarURL is null
    });

    test('Test ChatUser.fromJson handles complex full names', () {
      final chatUserJson = {
        'name': 'Dr. John Michael Smith Jr.',
        'id': 'user456',
        'avatarURL': 'https://example.com/avatar.jpg',
      };

      final chatUserFromJson = ChatUser.fromJson(chatUserJson);

      expect(
        chatUserFromJson.firstName,
        'Dr.',
      ); // Should extract first part before space
      expect(chatUserFromJson.id, 'user456');
      expect(chatUserFromJson.image, 'https://example.com/avatar.jpg');
    });
  });
}
