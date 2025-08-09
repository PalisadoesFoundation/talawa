import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/post_queries.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

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

    test(
        'getPostCreatedDuration returns correct strings for all time units and null',
        () {
      final now = DateTime.now();

      final cases = [
        {
          'post': Post(createdAt: now.subtract(const Duration(seconds: 2))),
          'expected': 'Seconds Ago',
        },
        {
          'post': Post(createdAt: now.subtract(const Duration(minutes: 2))),
          'expected': 'Minutes Ago',
        },
        {
          'post': Post(createdAt: now.subtract(const Duration(hours: 2))),
          'expected': 'Hours Ago',
        },
        {
          'post': Post(createdAt: now.subtract(const Duration(days: 5))),
          'expected': 'Days Ago',
        },
        {
          'post': Post(createdAt: now.subtract(const Duration(days: 65))),
          'expected': 'Months Ago',
        },
        {
          'post': Post(createdAt: now.subtract(const Duration(days: 800))),
          'expected': 'Years Ago',
        },
        {
          'post': Post(),
          'expected': 'unknown date',
        },
      ];

      for (final testCase in cases) {
        final post = testCase['post']! as Post;
        final expected = testCase['expected']! as String;
        final duration = post.getPostCreatedDuration();
        expect(duration, contains(expected), reason: 'Failed for $expected');
      }
    });

    test(
        'getPostPinnedDuration returns correct strings for all time units and null',
        () {
      final now = DateTime.now();

      final cases = [
        {
          'post': Post(pinnedAt: now.subtract(const Duration(seconds: 2))),
          'expected': 'Seconds Ago',
        },
        {
          'post': Post(pinnedAt: now.subtract(const Duration(minutes: 2))),
          'expected': 'Minutes Ago',
        },
        {
          'post': Post(pinnedAt: now.subtract(const Duration(hours: 2))),
          'expected': 'Hours Ago',
        },
        {
          'post': Post(pinnedAt: now.subtract(const Duration(days: 5))),
          'expected': 'Days Ago',
        },
        {
          'post': Post(pinnedAt: now.subtract(const Duration(days: 65))),
          'expected': 'Months Ago',
        },
        {
          'post': Post(pinnedAt: now.subtract(const Duration(days: 800))),
          'expected': 'Years Ago',
        },
        {
          'post': Post(),
          'expected': 'unknown date',
        },
      ];

      for (final testCase in cases) {
        final post = testCase['post']! as Post;
        final expected = testCase['expected']! as String;
        final duration = post.getPostPinnedDuration();
        expect(duration, contains(expected), reason: 'Failed for $expected');
      }
    });
  });
  group("getPresignedUrl functions tests", () {
    setUpAll(() {
      registerServices();
    });

    test('getPresignedUrl sets attachment.url if presignedUrl is returned',
        () async {
      final attachment = AttachmentModel(name: 'file.txt', url: null);
      final post = Post(attachments: [attachment]);

      final query = PostQueries().getPresignedUrl();
      final variables = {"objectName": 'file.txt', "organizationId": 'org1'};

      when(databaseFunctions.gqlAuthMutation(query, variables: variables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'createGetfileUrl': {
              'presignedUrl': 'https://example.com/file.txt',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      await post.getPresignedUrl('org1');

      expect(post.attachments!.first.url, 'https://example.com/file.txt');
    });

    test('getPresignedUrl sets fallback url if presignedUrl is missing',
        () async {
      final attachment = AttachmentModel(name: 'file.txt', url: null);
      final post = Post(attachments: [attachment]);

      final query = PostQueries().getPresignedUrl();
      final variables = {"objectName": 'file.txt', "organizationId": 'org1'};

      when(databaseFunctions.gqlAuthMutation(query, variables: variables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'createGetfileUrl': {
              'presignedUrl': null,
            },
          },
          source: QueryResultSource.network,
        ),
      );

      await post.getPresignedUrl('org1');

      expect(
        post.attachments!.first.url,
        'https://avatars.githubusercontent.com/u/24500036?s=280&v=4',
      );
    });

    test('getPresignedUrl returns early if id is null or empty', () async {
      final post =
          Post(attachments: [AttachmentModel(name: 'file.txt', url: null)]);
      // Should not throw or call gqlAuthMutation
      await post.getPresignedUrl(null);
      await post.getPresignedUrl('');
      // No assertion needed, just checking for no exceptions
    });

    test('getPresignedUrl returns early if attachments is null or empty',
        () async {
      final post = Post(attachments: null);
      await post.getPresignedUrl('org1');
      final post2 = Post(attachments: []);
      await post2.getPresignedUrl('org1');
      // No assertion needed, just checking for no exceptions
    });
  });
}
