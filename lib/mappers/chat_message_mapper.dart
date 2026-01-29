import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat_message.dart' as dto;
import 'package:talawa/models/domain/chat_message.dart';

/// Mapper for converting between ChatMessage DTO and Domain models.
class ChatMessageMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoMessage`: The ChatMessage DTO to convert
  ///
  /// **returns**:
  /// * `ChatMessage`: The converted domain model
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

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of ChatMessage DTOs to convert
  ///
  /// **returns**:
  /// * `List<ChatMessage>`: List of converted domain models
  static List<ChatMessage> fromDtoList(List<dto.ChatMessage>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
