import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Post Model', () {
    test('fromJson creates correct Post object', () {
      final json = {
        'id': 'post1',
        'caption': 'Test Caption',
        'createdAt': '2024-06-19T12:00:00Z',
        'creator': {
          'id': 'user1',
          'name': 'Alice',
        },
        'organization': {
          'id': 'org1',
          'name': 'Test Org',
        },
        'attachments': [
          {
            'name': 'file1.jpg',
            'fileHash': 'hash1',
            'mimeType': 'image/jpeg',
            'objectName': 'obj1',
            'url': 'https://example.com/file1.jpg',
          }
        ],
        'commentsCount': 5,
        'upvotesCount': 10,
        'downvotesCount': 2,
        'hasVoted': true,
        'voteType': 'upvote',
        'isPinned': true,
        'pinnedAt': '2024-06-18T12:00:00Z',
      };

      final post = Post.fromJson(json);

      expect(post.id, 'post1');
      expect(post.caption, 'Test Caption');
      expect(post.createdAt, DateTime.parse('2024-06-19T12:00:00Z'));
      expect(post.creator, isA<User>());
      expect(post.organization, isA<OrgInfo>());
      expect(post.attachments, isA<List<AttachmentModel>>());
      expect(post.commentsCount, 5);
      expect(post.upvotesCount, 10);
      expect(post.downvotesCount, 2);
      expect(post.hasVoted, true);
      expect(post.voteType, 'upvote');
      expect(post.isPinned, true);
      expect(post.pinnedAt, DateTime.parse('2024-06-18T12:00:00Z'));
    });

    test('getPostCreatedDuration returns correct string', () {
      final now = DateTime.now();
      final post = Post(createdAt: now.subtract(const Duration(minutes: 5)));
      final duration = post.getPostCreatedDuration();
      expect(duration, contains('Minutes Ago'));
    });

    test('getPostCreatedDuration returns "unknown date" if null', () {
      final post = Post();
      expect(post.getPostCreatedDuration(), 'unknown date');
    });

    test('getPostPinnedDuration returns correct string', () {
      final now = DateTime.now();
      final post = Post(pinnedAt: now.subtract(const Duration(hours: 2)));
      final duration = post.getPostPinnedDuration();
      expect(duration, contains('Hours Ago'));
    });

    test('getPostPinnedDuration returns "unknown date" if null', () {
      final post = Post();
      expect(post.getPostPinnedDuration(), 'unknown date');
    });
  });
}
