import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat_member.dart' as dto;
import 'package:talawa/models/domain/chat_member.dart';

/// Mapper for converting between ChatMember DTO and Domain models.
class ChatMemberMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoMember`: The ChatMember DTO to convert
  ///
  /// **returns**:
  /// * `ChatMember`: The converted domain model
  static ChatMember fromDto(dto.ChatMember dtoMember) {
    ChatMemberRole? role;
    if (dtoMember.role == dto.ChatMembershipRole.administrator) {
      role = ChatMemberRole.administrator;
    } else if (dtoMember.role == dto.ChatMembershipRole.regular) {
      role = ChatMemberRole.regular;
    }

    return ChatMember(
      user: ChatUserMapper.fromDto(dtoMember.user),
      role: role,
    );
  }

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of ChatMember DTOs to convert
  ///
  /// **returns**:
  /// * `List<ChatMember>`: List of converted domain models
  static List<ChatMember> fromDtoList(List<dto.ChatMember>? dtos) {
    return dtos?.map(fromDto).toList() ?? [];
  }
}
