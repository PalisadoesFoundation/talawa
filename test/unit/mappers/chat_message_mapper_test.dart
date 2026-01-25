import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_message_mapper.dart';
import 'package:talawa/models/chats/chat_message.dart' as dto;
import 'package:talawa/models/chats/chat_user.dart' as dto_user;

void main() {
  group('ChatMessageMapper', () {
    test('fromDto converts message with all fields', () {
      final dtoMessage = dto.ChatMessage(
        id: 'msg123',
        body: 'Hello world',
        creator: dto_user.ChatUser(id: 'user1', firstName: 'John'),
        chatId: 'chat1',
        createdAt: '2026-01-25T10:00:00Z',
      );

      final domain = ChatMessageMapper.fromDto(dtoMessage);

      expect(domain.id, 'msg123');
      expect(domain.body, 'Hello world');
      expect(domain.creator?.id, 'user1');
      expect(domain.chatId, 'chat1');
      expect(domain.hasBody, true);
    });

    test('fromDto handles reply messages', () {
      final parentDto = dto.ChatMessage(id: 'parent', body: 'Original');
      final replyDto = dto.ChatMessage(
        id: 'reply',
        body: 'Reply',
        parentMessage: parentDto,
      );

      final domain = ChatMessageMapper.fromDto(replyDto);

      expect(domain.isReply, true);
      expect(domain.parentMessage?.id, 'parent');
    });
  });
}
