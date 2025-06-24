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

    test('getPostPinnedDuration returns correct string for hours', () {
      final now = DateTime.now();
      final post = Post(pinnedAt: now.subtract(const Duration(hours: 2)));
      final duration = post.getPostPinnedDuration();
      expect(duration, contains('Hours Ago'));
    });
    test('getPostPinnedDuration returns correct string for minutes', () {
      final now = DateTime.now();
      final post = Post(pinnedAt: now.subtract(const Duration(minutes: 2)));
      final duration = post.getPostPinnedDuration();
      expect(duration, contains('Minutes Ago'));
    });
    test('getPostPinnedDuration returns correct string for days', () {
      final now = DateTime.now();
      final post = Post(pinnedAt: now.subtract(const Duration(days: 5)));
      final duration = post.getPostPinnedDuration();
      expect(duration, contains('Days Ago'));
    });

    test('getPostPinnedDuration returns correct string for months', () {
      final now = DateTime.now();
      final post = Post(pinnedAt: now.subtract(const Duration(days: 65)));
      final duration = post.getPostPinnedDuration();
      expect(duration, contains('Months Ago'));
    });

    test('getPostPinnedDuration returns correct string for years', () {
      final now = DateTime.now();
      final post = Post(pinnedAt: now.subtract(const Duration(days: 800)));
      final duration = post.getPostPinnedDuration();
      expect(duration, contains('Years Ago'));
    });

    test('getPostPinnedDuration returns "unknown date" if null', () {
      final post = Post();
      expect(post.getPostPinnedDuration(), 'unknown date');
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
            'createGetfileUrl': {'presignedUrl': 'https://example.com/file.txt'}
          },
          source: QueryResultSource.network,
        ),
      );

      await post.getPresignedUrl('org1');

      expect(post.attachments!.first.url, 'https://example.com/file.txt');
    });

    test('getPresignedUrl does not set url if presignedUrl is missing',
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
            }
          },
          source: QueryResultSource.network,
        ),
      );

      await post.getPresignedUrl('org1');

      expect(post.attachments!.first.url, isNull);
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
