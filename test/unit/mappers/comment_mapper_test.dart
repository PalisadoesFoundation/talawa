import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/mappers/comment_mapper.dart';
import 'package:talawa/models/comment/comment_model.dart' as dto;

void main() {
  group('CommentMapper', () {
    test('fromDto converts comment with votes', () {
      final dtoComment = dto.Comment(
        id: 'comment123',
        body: 'Great post!',
        createdAt: '2026-01-25T10:00:00Z',
        upvotesCount: 5,
        downvotesCount: 1,
        voteType: VoteType.upVote,
      );

      final domain = CommentMapper.fromDto(dtoComment);

      expect(domain.id, 'comment123');
      expect(domain.body, 'Great post!');
      expect(domain.totalUpvotes, 5);
      expect(domain.netVotes, 4);
    });
  });
}
