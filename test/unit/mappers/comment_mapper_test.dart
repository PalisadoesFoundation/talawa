import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/mappers/comment_mapper.dart';
import 'package:talawa/models/comment/comment_model.dart' as dto;
import 'package:talawa/models/post/post_model.dart' as dto;
import 'package:talawa/models/user/user_info.dart' as dto;

void main() {
  group('CommentMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoComment = dto.Comment(
          id: 'comment123',
          body: 'Great post!',
          createdAt: '2024-01-01T10:00:00Z',
          creator: dto.User(id: 'user1', name: 'John Doe'),
          post: dto.Post(id: 'post1', caption: 'Test post'),
          hasVoted: true,
          upvotesCount: 10,
          downvotesCount: 2,
          voteType: VoteType.upVote,
        );

        final domain = CommentMapper.fromDto(dtoComment);

        expect(domain.id, 'comment123');
        expect(domain.body, 'Great post!');
        expect(domain.creator?.id, 'user1');
        expect(domain.post?.id, 'post1');
        expect(domain.hasVoted, true);
        expect(domain.upvotesCount, 10);
        expect(domain.downvotesCount, 2);
        expect(domain.voteType, VoteType.upVote);
        expect(domain.totalUpvotes, 10);
        expect(domain.totalDownvotes, 2);
        expect(domain.netVotes, 8);
        expect(domain.hasVotes, true);
      });

      test('handles null creator and post', () {
        final dtoComment = dto.Comment(
          id: 'comment456',
          body: 'Another comment',
        );

        final domain = CommentMapper.fromDto(dtoComment);

        expect(domain.id, 'comment456');
        expect(domain.creator, isNull);
        expect(domain.post, isNull);
      });

      test('computes timeAgo correctly', () {
        final now = DateTime.now();
        final dtoComment = dto.Comment(
          id: 'comment789',
          createdAt: now.subtract(const Duration(minutes: 5)).toIso8601String(),
        );

        final domain = CommentMapper.fromDto(dtoComment);
        expect(domain.timeAgo, contains('m'));
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs', () {
        final dtos = [
          dto.Comment(id: 'c1', body: 'Comment 1'),
          dto.Comment(id: 'c2', body: 'Comment 2'),
        ];

        final domains = CommentMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].id, 'c1');
        expect(domains[1].id, 'c2');
      });

      test('handles null list', () {
        final domains = CommentMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
