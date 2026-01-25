import 'package:talawa/models/domain/post.dart';
import 'package:talawa/models/post/post_model.dart' as dto;

/// Minimal PostMapper for Comment references
/// Full PostMapper will be created in Part 3
class PostMapper {
  static Post fromDto(dto.Post dtoPost) {
    return Post(
      id: dtoPost.id ?? '',
      caption: dtoPost.caption,
    );
  }
}
