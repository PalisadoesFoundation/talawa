import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_mapper.dart';
import 'package:talawa/models/chats/chat.dart' as dto;

void main() {
  group('ChatMapper', () {
    test('fromDto converts chat with all fields', () {
      final dtoChat = dto.Chat(
        id: 'chat123',
        name: 'Team Chat',
        description: 'Team discussion',
        createdAt: '2026-01-25T10:00:00Z',
      );

      final domain = ChatMapper.fromDto(dtoChat);

      expect(domain.id, 'chat123');
      expect(domain.name, 'Team Chat');
      expect(domain.description, 'Team discussion');
      expect(domain.displayName, 'Team Chat');
    });
  });
}
