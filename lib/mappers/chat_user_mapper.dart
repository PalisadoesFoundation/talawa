import 'package:talawa/models/chats/chat_user.dart' as dto;
import 'package:talawa/models/domain/chat_user.dart';

/// Mapper for converting between ChatUser DTO and Domain models
class ChatUserMapper {
  static ChatUser fromDto(dto.ChatUser dtoUser) {
    return ChatUser(
      id: dtoUser.id ?? '',
      firstName: dtoUser.firstName,
      image: dtoUser.image,
    );
  }

  static dto.ChatUser toDto(ChatUser domain) {
    return dto.ChatUser(
      id: domain.id,
      firstName: domain.firstName,
      image: domain.image,
    );
  }

  static List<ChatUser> fromDtoList(List<dto.ChatUser>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
