import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';

// late String sId;
// String? description;
// DateTime? createdAt;
// String? imageUrl;
// String? videoUrl;
// User? creator;
// OrgInfo? organization;
// List<LikedBy>? likedBy;
// List<Comments>? comments;

void main() {
  group('Test Post model', () {
    final myBirthday = DateTime.utc(2004, DateTime.june, 16);
    test('Test Post model', () {
      final comment = Post(
        creator: User(
          id: '123',
          firstName: 'John',
          lastName: 'Doe',
          email: 'test@test.com',
        ),
        sId: "sid",
        createdAt: myBirthday,
        description: 'test description',
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
