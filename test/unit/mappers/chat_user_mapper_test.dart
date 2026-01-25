import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat_user.dart' as dto;

void main() {
  group('ChatUserMapper', () {
    test('fromDto converts all fields', () {
      final dtoUser = dto.ChatUser(
        id: 'user123',
        firstName: 'John',
        image: 'https://example.com/avatar.jpg',
      );

      final domain = ChatUserMapper.fromDto(dtoUser);

      expect(domain.id, 'user123');
      expect(domain.firstName, 'John');
      expect(domain.image, 'https://example.com/avatar.jpg');
      expect(domain.initials, 'J');
      expect(domain.hasImage, true);
    });

    test('handles null values', () {
      final dtoUser = dto.ChatUser(id: 'user456');
      final domain = ChatUserMapper.fromDto(dtoUser);

      expect(domain.id, 'user456');
      expect(domain.displayName, 'Unknown');
    });
  });
}
