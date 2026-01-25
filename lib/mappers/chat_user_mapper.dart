import 'package:talawa/models/chats/chat_user.dart' as dto;
import 'package:talawa/models/domain/chat_user.dart';

/// Mapper for converting between ChatUser DTO and Domain models.
class ChatUserMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoUser`: The ChatUser DTO to convert
  ///
  /// **returns**:
  /// * `ChatUser`: The converted domain model
  static ChatUser fromDto(dto.ChatUser dtoUser) {
    return ChatUser(
      id: dtoUser.id ?? '',
      firstName: dtoUser.firstName,
      image: dtoUser.image,
    );
  }

  /// Converts Domain model to DTO.
  ///
  /// **params**:
  /// * `domain`: The ChatUser domain model to convert
  ///
  /// **returns**:
  /// * `ChatUser`: The converted DTO
  static dto.ChatUser toDto(ChatUser domain) {
    return dto.ChatUser(
      id: domain.id,
      firstName: domain.firstName,
      image: domain.image,
    );
  }

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of ChatUser DTOs to convert
  ///
  /// **returns**:
  /// * `List<ChatUser>`: List of converted domain models
  static List<ChatUser> fromDtoList(List<dto.ChatUser>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
