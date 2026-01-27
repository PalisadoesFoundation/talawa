import 'package:talawa/models/domain/user.dart';
import 'package:talawa/models/user/user_info.dart' as dto;

/// Minimal UserMapper for Comment references.
///
/// Full UserMapper will be created in Part 2.
class UserMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoUser`: The User DTO to convert
  ///
  /// **returns**:
  /// * `User`: The converted domain model
  static User fromDto(dto.User dtoUser) {
    return User(
      id: dtoUser.id ?? '',
      name: dtoUser.name,
      email: dtoUser.email,
      image: dtoUser.image,
    );
  }
}
