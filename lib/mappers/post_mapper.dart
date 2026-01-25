import 'package:talawa/models/domain/post.dart';
import 'package:talawa/models/post/post_model.dart' as dto;

/// Minimal PostMapper for Comment references.
///
/// Full PostMapper will be created in Part 3.
class PostMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoPost`: The Post DTO to convert
  ///
  /// **returns**:
  /// * `Post`: The converted domain model
  static Post fromDto(dto.Post dtoPost) {
    return Post(
      id: dtoPost.id ?? '',
      caption: dtoPost.caption,
    );
  }
}
