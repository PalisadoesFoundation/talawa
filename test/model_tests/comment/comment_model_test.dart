// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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
