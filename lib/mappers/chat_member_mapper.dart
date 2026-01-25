import 'package:talawa/mappers/chat_user_mapper.dart';
import 'package:talawa/models/chats/chat_member.dart' as dto;
import 'package:talawa/models/domain/chat_member.dart';

class ChatMemberMapper {
  static ChatMember fromDto(dto.ChatMember dtoMember) {
    // Convert DTO role to domain role
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

  static List<ChatMember> fromDtoList(List<dto.ChatMember>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
