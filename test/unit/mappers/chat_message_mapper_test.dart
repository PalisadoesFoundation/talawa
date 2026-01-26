import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_message_mapper.dart';
import 'package:talawa/models/chats/chat_message.dart' as dto;
import 'package:talawa/models/chats/chat_user.dart' as dto;

void main() {
  group('ChatMessageMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoMessage = dto.ChatMessage(
          id: 'msg123',
          body: 'Hello world',
          creator: dto.ChatUser(id: 'user1', firstName: 'John'),
          chatId: 'chat1',
          createdAt: '2024-01-01T10:00:00Z',
          updatedAt: '2024-01-01T10:05:00Z',
        );

        final domain = ChatMessageMapper.fromDto(dtoMessage);

        expect(domain.id, 'msg123');
        expect(domain.body, 'Hello world');
        expect(domain.creator?.id, 'user1');
        expect(domain.chatId, 'chat1');
        expect(domain.displayBody, 'Hello world');
        expect(domain.hasBody, true);
        expect(domain.isReply, false);
      });

      test('handles reply messages', () {
        final parentDto = dto.ChatMessage(id: 'parent1', body: 'Original');
        final replyDto = dto.ChatMessage(
          id: 'reply1',
          body: 'Reply',
          parentMessage: parentDto,
        );

        final domain = ChatMessageMapper.fromDto(replyDto);

        expect(domain.isReply, true);
        expect(domain.parentMessage?.id, 'parent1');
      });

      test('computes timeAgo for hours', () {
        final now = DateTime.now();
        final dtoMessage = dto.ChatMessage(
          id: 'msg456',
          createdAt: now.subtract(const Duration(hours: 2)).toIso8601String(),
        );

        final domain = ChatMessageMapper.fromDto(dtoMessage);
        expect(domain.timeAgo, '2h ago');
      });

      test('computes timeAgo for days', () {
        final now = DateTime.now();
        final dtoMessage = dto.ChatMessage(
          id: 'msg_days',
          createdAt: now.subtract(const Duration(days: 3)).toIso8601String(),
        );

        final domain = ChatMessageMapper.fromDto(dtoMessage);
        expect(domain.timeAgo, '3d ago');
      });

      test('computes timeAgo for weeks', () {
        final now = DateTime.now();
        final dtoMessage = dto.ChatMessage(
          id: 'msg_weeks',
          createdAt: now.subtract(const Duration(days: 21)).toIso8601String(),
        );

        final domain = ChatMessageMapper.fromDto(dtoMessage);
        expect(domain.timeAgo, '3w ago');
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs', () {
        final dtos = [
          dto.ChatMessage(id: 'm1', body: 'Message 1'),
          dto.ChatMessage(id: 'm2', body: 'Message 2'),
        ];

        final domains = ChatMessageMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].id, 'm1');
        expect(domains[1].id, 'm2');
      });

      test('handles null list', () {
        final domains = ChatMessageMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
