import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  final comment = Comment(
    creator: User(
      id: '123',
      firstName: 'John',
      lastName: 'Doe',
      email: 'test@test.com',
    ),
    createdAt: '123456',
    body: 'test text',
    post: null,
  );

  final commentJson = {
    'creator': {
      'user': {
        'id': '123',
        'name': 'John Doe',
        'emailAddress': 'test@test.com',
        'avatarURL': null,
      },
    },
    'createdAt': '123456',
    'body': 'test text',
    'post': null,
  };

  group('Test Comment model', () {
    test('Test task json', () {
      final commentFromJson = Comment.fromJson(commentJson);
      expect(comment.creator?.id, commentFromJson.creator?.id);
      expect(comment.creator?.firstName, commentFromJson.creator?.firstName);
      expect(comment.creator?.lastName, commentFromJson.creator?.lastName);
      expect(comment.creator?.email, commentFromJson.creator?.email);
      expect(comment.createdAt, commentFromJson.createdAt);
      expect(comment.body, commentFromJson.body);
      expect(comment.post, commentFromJson.post);
    });
  });
  test('Comment.fromJson sets post when json["post"] is not null', () {
    final commentJson = {
      'id': 'comment1',
      'body': 'This is a comment',
      'post': {
        'id': 'post1',
        'caption': 'Test Post',
        'createdAt': '2024-06-24T12:00:00Z',
        'commentsCount': 2,
        'upVotesCount': 5,
        'downVotesCount': 1,
        'attachments': [],
        'isPinned': false,
        'pinnedAt': null,
      },
      'creator': {
        'id': 'user2',
        'image': null,
      },
      'createdAt': '2024-06-24T12:01:00Z',
    };

    final comment = Comment.fromJson(commentJson);

    expect(comment.post, isNotNull);
    expect(comment.post!.id, 'post1');
    expect(comment.post!.caption, 'Test Post');
    expect(comment.body, 'This is a comment');
  });

  test('Comment.fromJson sets post to null when json["post"] is null', () {
    final commentJson = {
      'id': 'comment2',
      'body': 'Another comment',
      'post': null,
      'creator': {
        'id': 'user3',
        'image': null,
      },
      'createdAt': '2024-06-24T12:02:00Z',
    };

    final comment = Comment.fromJson(commentJson);

    expect(comment.post, isNull);
    expect(comment.body, 'Another comment');
  });

  group('Test caching part of comment', () {
    late final Box<Comment> commentBox;
    setUpAll(() async {
      commentBox = await Hive.openBox<Comment>('comment_box');
    });
    tearDownAll(() async {
      await commentBox.close();
    });
    test('put and get', () {
      commentBox.put('key', comment);
      final Comment fetchedComment = commentBox.get('key')!;
      expect(
        fetchedComment,
        isNotNull,
      ); // Check that the fetched comment is not null
      expect(fetchedComment.body, comment.body);
      expect(fetchedComment.createdAt, comment.createdAt);
      expect(fetchedComment.post, comment.post);
    });

    test('adapter equality', () {
      final adapter1 = CommentAdapter();
      final adapter2 = CommentAdapter();

      expect(adapter2.hashCode, isA<int>());

      expect(adapter2 == adapter1, true);
    });
  });
}
