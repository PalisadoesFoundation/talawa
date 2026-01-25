import 'package:talawa/mappers/chat_message_mapper.dart';
import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat.dart' as dto;
import 'package:talawa/models/domain/chat.dart';

/// Mapper for converting between Chat DTO and Domain models
class ChatMapper {
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

  static List<Chat> fromDtoList(List<dto.Chat>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
