import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_member.dart';
import 'package:talawa/models/chats/chat_user.dart';

void main() {
  group('ChatMembershipRole Tests', () {
    test('toChatMembershipRole converts administrator correctly', () {
      expect(
        'administrator'.toChatMembershipRole(),
        equals(ChatMembershipRole.administrator),
      );
    });

    test('toChatMembershipRole converts regular correctly', () {
      expect(
        'regular'.toChatMembershipRole(),
        equals(ChatMembershipRole.regular),
      );
    });

    test('toChatMembershipRole handles case insensitivity', () {
      expect(
        'ADMINISTRATOR'.toChatMembershipRole(),
        equals(ChatMembershipRole.administrator),
      );
      expect(
        'Regular'.toChatMembershipRole(),
        equals(ChatMembershipRole.regular),
      );
    });

    test('toChatMembershipRole returns null for invalid role', () {
      expect('invalid'.toChatMembershipRole(), isNull);
      expect(''.toChatMembershipRole(), isNull);
    });
  });

  group('ChatMember Tests', () {
    test('fromJson creates ChatMember with user and role', () {
      final json = {
        'user': {
          'id': 'user123',
          'name': 'John Doe',
        },
        'role': 'administrator',
      };

      final chatMember = ChatMember.fromJson(json);

      expect(chatMember.user.id, equals('user123'));
      expect(chatMember.user.firstName, equals('John'));
      expect(chatMember.role, equals(ChatMembershipRole.administrator));
    });

    test('fromJson creates ChatMember with regular role', () {
      final json = {
        'user': {
          'id': 'user456',
          'name': 'Jane Smith',
        },
        'role': 'regular',
      };

      final chatMember = ChatMember.fromJson(json);

      expect(chatMember.user.id, equals('user456'));
      expect(chatMember.user.firstName, equals('Jane'));
      expect(chatMember.role, equals(ChatMembershipRole.regular));
    });

    test('fromJson handles missing role', () {
      final json = {
        'user': {
          'id': 'user789',
          'name': 'Bob Johnson',
        },
      };

      final chatMember = ChatMember.fromJson(json);

      expect(chatMember.user.id, equals('user789'));
      expect(chatMember.user.firstName, equals('Bob'));
      expect(chatMember.role, isNull);
    });

    test('fromJson handles null user', () {
      final json = <String, dynamic>{
        'role': 'regular',
      };

      final chatMember = ChatMember.fromJson(json);

      expect(chatMember.user, isNotNull);
      expect(chatMember.user.id, isNull);
      expect(chatMember.role, equals(ChatMembershipRole.regular));
    });

    test('fromJson handles invalid role', () {
      final json = {
        'user': {
          'id': 'user999',
          'name': 'Alice Brown',
        },
        'role': 'invalid_role',
      };

      final chatMember = ChatMember.fromJson(json);

      expect(chatMember.user.id, equals('user999'));
      expect(chatMember.role, isNull);
    });

    test('toJson converts ChatMember to JSON with role', () {
      final user = ChatUser(
        id: 'user123',
        firstName: 'John',
        image: 'http://example.com/avatar.jpg',
      );
      final chatMember = ChatMember(
        user: user,
        role: ChatMembershipRole.administrator,
      );

      final json = chatMember.toJson();

      expect(json['user'], isNotNull);
      final userJson = json['user'] as Map<String, dynamic>;
      expect(userJson['id'], equals('user123'));
      expect(userJson['firstName'], equals('John'));
      expect(json['role'], equals('administrator'));
    });

    test('toJson converts ChatMember to JSON without role', () {
      final user = ChatUser(
        id: 'user456',
        firstName: 'Jane',
      );
      final chatMember = ChatMember(
        user: user,
      );

      final json = chatMember.toJson();

      expect(json['user'], isNotNull);
      final userJson = json['user'] as Map<String, dynamic>;
      expect(userJson['id'], equals('user456'));
      expect(json['role'], isNull);
    });

    test('ChatMember constructor sets properties correctly', () {
      final user = ChatUser(
        id: 'user789',
        firstName: 'Bob',
      );
      final chatMember = ChatMember(
        user: user,
        role: ChatMembershipRole.regular,
      );

      expect(chatMember.user, equals(user));
      expect(chatMember.role, equals(ChatMembershipRole.regular));
    });
  });
}
