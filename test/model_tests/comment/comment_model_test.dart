// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Test Task model', () {
    test('Test task json', () {
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
}
