import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat_message.dart' as dto;
import 'package:talawa/models/domain/chat_message.dart';

/// Mapper for converting between ChatMessage DTO and Domain models
class ChatMessageMapper {
  static ChatMessage fromDto(dto.ChatMessage dtoMessage) {
    return ChatMessage(
      id: dtoMessage.id ?? '',
      body: dtoMessage.body,
      creator: dtoMessage.creator != null
          ? ChatUserMapper.fromDto(dtoMessage.creator!)
          : null,
      chatId: dtoMessage.chatId,
      parentMessage: dtoMessage.parentMessage != null
          ? fromDto(dtoMessage.parentMessage!)
          : null,
      createdAt: dtoMessage.createdAt != null
          ? DateTime.tryParse(dtoMessage.createdAt!)
          : null,
      updatedAt: dtoMessage.updatedAt != null
          ? DateTime.tryParse(dtoMessage.updatedAt!)
          : null,
    );
  }

  static List<ChatMessage> fromDtoList(List<dto.ChatMessage>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
