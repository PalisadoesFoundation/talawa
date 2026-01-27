import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat_user.dart' as dto;
import 'package:talawa/models/domain/chat_user.dart';

void main() {
  group('ChatUserMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoUser = dto.ChatUser(
          id: 'user123',
          firstName: 'John',
          image: 'https://example.com/avatar.jpg',
        );

        final domain = ChatUserMapper.fromDto(dtoUser);

        expect(domain.id, 'user123');
        expect(domain.firstName, 'John');
        expect(domain.image, 'https://example.com/avatar.jpg');
        expect(domain.displayName, 'John');
        expect(domain.initials, 'J');
        expect(domain.hasImage, true);
      });

      test('handles null firstName', () {
        final dtoUser = dto.ChatUser(id: 'user456');

        final domain = ChatUserMapper.fromDto(dtoUser);

        expect(domain.displayName, 'Unknown');
        expect(domain.displayName, 'Unknown');
        expect(domain.initials, '?');
      });

      test('handles null id', () {
        final dtoUser = dto.ChatUser(firstName: 'Test');

        final domain = ChatUserMapper.fromDto(dtoUser);

        expect(domain.id, '');
        expect(domain.firstName, 'Test');
      });
    });

    group('toDto', () {
      test('converts domain model to DTO', () {
        const domain = ChatUser(
          id: 'user789',
          firstName: 'Jane',
          image: 'https://example.com/jane.jpg',
        );

        final dtoUser = ChatUserMapper.toDto(domain);

        expect(dtoUser.id, 'user789');
        expect(dtoUser.firstName, 'Jane');
        expect(dtoUser.image, 'https://example.com/jane.jpg');
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs', () {
        final dtos = [
          dto.ChatUser(id: 'u1', firstName: 'User 1'),
          dto.ChatUser(id: 'u2', firstName: 'User 2'),
        ];

        final domains = ChatUserMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].id, 'u1');
        expect(domains[1].id, 'u2');
      });

      test('handles null list', () {
        final domains = ChatUserMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
