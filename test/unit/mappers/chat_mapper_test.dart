import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_mapper.dart';
import 'package:talawa/mappers/chat_message_mapper.dart';
import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat.dart' as dto;
import 'package:talawa/models/chats/chat_message.dart' as dto;
import 'package:talawa/models/chats/chat_user.dart' as dto;

void main() {
  group('ChatMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoChat = dto.Chat(
          id: 'chat123',
          name: 'Team Chat',
          description: 'Team discussion',
          createdAt: '2024-01-01T10:00:00Z',
          updatedAt: '2024-01-01T12:00:00Z',
          creator: dto.ChatUser(id: 'user1', firstName: 'John'),
          members: [
            dto.ChatUser(id: 'user1', firstName: 'John'),
            dto.ChatUser(id: 'user2', firstName: 'Jane'),
          ],
          messages: [
            dto.ChatMessage(id: 'msg1', body: 'Hello'),
          ],
        );

        final domain = ChatMapper.fromDto(dtoChat);

        expect(domain.id, 'chat123');
        expect(domain.name, 'Team Chat');
        expect(domain.description, 'Team discussion');
        expect(domain.creator?.id, 'user1');
        expect(domain.memberCount, 2);
        expect(domain.hasMessages, true);
        expect(domain.lastMessage?.id, 'msg1');
        expect(domain.displayName, 'Team Chat');
      });

      test('handles null name', () {
        final dtoChat = dto.Chat(id: 'chat456');

        final domain = ChatMapper.fromDto(dtoChat);

        expect(domain.displayName, 'Unnamed Chat');
      });

      test('handles empty messages', () {
        final dtoChat = dto.Chat(id: 'chat789', messages: []);

        final domain = ChatMapper.fromDto(dtoChat);

        expect(domain.hasMessages, false);
        expect(domain.lastMessage, isNull);
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs', () {
        final dtos = [
          dto.Chat(id: 'c1', name: 'Chat 1'),
          dto.Chat(id: 'c2', name: 'Chat 2'),
        ];

        final domains = ChatMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].id, 'c1');
        expect(domains[1].id, 'c2');
      });

      test('handles null list', () {
        final domains = ChatMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
