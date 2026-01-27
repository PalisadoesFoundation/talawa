import 'package:talawa/mappers/chat_message_mapper.dart';
import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat.dart' as dto;
import 'package:talawa/models/domain/chat.dart';

/// Mapper for converting between Chat DTO and Domain models.
class ChatMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoChat`: The Chat DTO to convert
  ///
  /// **returns**:
  /// * `Chat`: The converted domain model
  static Chat fromDto(dto.Chat dtoChat) {
    return Chat(
      id: dtoChat.id ?? '',
      name: dtoChat.name,
      description: dtoChat.description,
      createdAt: dtoChat.createdAt != null
          ? DateTime.tryParse(dtoChat.createdAt!)
          : null,
      updatedAt: dtoChat.updatedAt != null
          ? DateTime.tryParse(dtoChat.updatedAt!)
          : null,
      creator: dtoChat.creator != null
          ? ChatUserMapper.fromDto(dtoChat.creator!)
          : null,
      members: ChatUserMapper.fromDtoList(dtoChat.members),
      messages: ChatMessageMapper.fromDtoList(dtoChat.messages),
    );
  }

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of Chat DTOs to convert
  ///
  /// **returns**:
  /// * `List<Chat>`: List of converted domain models
  static List<Chat> fromDtoList(List<dto.Chat>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
