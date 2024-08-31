// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/user/user_info.dart';

final comment = Comment(
  creator: User(
    id: '123',
    firstName: 'John',
    lastName: 'Doe',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  text: 'test text',
  post: 'test post',
  likeCount: 'test count',
);

final commentJson = {
  'creator': {
    '_id': '123',
    'firstName': 'John',
    'lastName': 'Doe',
    'email': 'test@test.com',
  },
  'createdAt': '123456',
  'text': 'test text',
  'post': 'test post',
  'likeCount': 'test count',
};

void main() {
  group('Test Comment model', () {
    test('Test task json', () {
      final commentFromJson = Comment.fromJson(commentJson);
      expect(comment.creator?.id, commentFromJson.creator?.id);
      expect(comment.creator?.firstName, commentFromJson.creator?.firstName);
      expect(comment.creator?.lastName, commentFromJson.creator?.lastName);
      expect(comment.creator?.email, commentFromJson.creator?.email);
      expect(comment.createdAt, commentFromJson.createdAt);
      expect(comment.text, commentFromJson.text);
      expect(comment.post, commentFromJson.post);
      expect(comment.likeCount, commentFromJson.likeCount);
    });
  });

  group('Test caching part of comment', () {
    late final Box<Comment> commentBox;
    setUpAll(() async {
      commentBox = await Hive.openBox<Comment>('comment_box');
    });
    test('put and get', () async {
      commentBox.put('key', comment);
      final Comment fetchedComment = commentBox.get('key')!;
      expect(
        fetchedComment,
        isNotNull,
      ); // Check that the fetched comment is not null
      expect(fetchedComment.text, comment.text);
      expect(fetchedComment.createdAt, comment.createdAt);
      expect(fetchedComment.post, comment.post);
      expect(fetchedComment.likeCount, comment.likeCount);
    });

    test('adapter equality', () {
      final adapter1 = CommentAdapter();
      final adapter2 = CommentAdapter();

      expect(adapter2.hashCode, isA<int>());

      expect(adapter2 == adapter1, true);
    });
  });
}
