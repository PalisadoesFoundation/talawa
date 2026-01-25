import 'package:talawa/mappers/post_mapper.dart';
import 'package:talawa/mappers/user_mapper.dart';
import 'package:talawa/models/comment/comment_model.dart' as dto;
import 'package:talawa/models/domain/comment.dart';

/// Mapper for converting between Comment DTO and Domain models.
class CommentMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoComment`: The Comment DTO to convert
  ///
  /// **returns**:
  /// * `Comment`: The converted domain model
  static Comment fromDto(dto.Comment dtoComment) {
    return Comment(
      id: dtoComment.id ?? '',
      body: dtoComment.body,
      createdAt: dtoComment.createdAt != null
          ? DateTime.tryParse(dtoComment.createdAt!)
          : null,
      creator: dtoComment.creator != null
          ? UserMapper.fromDto(dtoComment.creator!)
          : null,
      post:
          dtoComment.post != null ? PostMapper.fromDto(dtoComment.post!) : null,
      hasVoted: dtoComment.hasVoted,
      upvotesCount: dtoComment.upvotesCount,
      downvotesCount: dtoComment.downvotesCount,
      voteType: dtoComment.voteType,
    );
  }

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of Comment DTOs to convert
  ///
  /// **returns**:
  /// * `List<Comment>`: List of converted domain models
  static List<Comment> fromDtoList(List<dto.Comment>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
