// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Test Post model', () {
    final u1 = User(
      id: '123',
      firstName: 'John',
      lastName: 'Doe',
      email: 'test@test.com',
    );
    final u2 = User(
      id: '123',
      firstName: 'Ayush',
      lastName: 'Chaudhary',
      email: 'test@test.com',
    );
    final List<User> users = [u1, u2];

    final LikedBy l1 = LikedBy(sId: 'test1');
    final LikedBy l2 = LikedBy(sId: 'test2');
    final List<LikedBy> likeby = [l1, l2];

    final comment1 = Comments(sId: 'comment1');
    final comment2 = Comments(sId: 'comment2');
    final comment3 = Comments(sId: 'comment3');
    final List<Comments> comments = [comment1, comment2, comment3];

    test('Test Post model', () {
      final myBirthday = DateTime.utc(2004, DateTime.june, 16, 5, 30, 0, 0, 0);
      final post = Post(
        creator: User(
          id: '123',
          firstName: 'John',
          lastName: 'Doe',
          email: 'test@test.com',
        ),
        sId: "sid",
        createdAt: myBirthday,
        description: 'test description',
        imageUrl: 'https://image.com',
        videoUrl: 'https://image.com',
        organization: OrgInfo(admins: users),
        likedBy: likeby,
        comments: comments,
      );
      final postJson = {
        'creator': {
          '_id': '123',
          'firstName': 'John',
          'lastName': 'Doe',
          'email': 'test@test.com',
        },
        '_id': '1222',
        'createdAt': '2023-03-15T15:28:52.122Z',
        'description': 'test description',
        'imageUrl': 'https://image.com',
        'videoUrl': 'https://image.com',
        'organization': {
          'admins': [
            {
              'id': '123',
              'firstName': 'Ayush',
              'lastName': 'Chaudhary',
              'email': 'test@test.com',
            },
            {
              'id': '123',
              'firstName': 'John',
              'lastName': 'Doe',
              'email': 'test@test.com',
            }
          ],
        },
        'likedBy': [
          {'_id': 'test1'},
          {'_id': 'test2'}
        ],
        'comments': [
          {
            '_id': 'comment1',
          },
          {
            '_id': 'comment2',
          },
          {
            '_id': 'comment3',
          }
        ]
      };
      final postFromJson = Post.fromJson(postJson);
      post.getPostCreatedDuration();
      expect(post.creator?.id, postFromJson.creator?.id);
      expect(post.creator?.firstName, postFromJson.creator?.firstName);
      expect(post.creator?.lastName, postFromJson.creator?.lastName);
      expect(post.creator?.email, postFromJson.creator?.email);
    });
    // final post = Post(
    //   creator: User(
    //     id: '123',
    //     firstName: 'John',
    //     lastName: 'Doe',
    //     email: 'test@test.com',
    //   ),
    //   sId: "sid",
    //   createdAt: myBirthday,
    //   description: 'test description',
    //   imageUrl: 'https://image.com',
    //   videoUrl: 'https://image.com',
    //   organization: OrgInfo(admins: users),
    //   likedBy: likeby,
    //   comments: comments,
    // );
    group('check if getPostCreatedBuration is working', () {
      test('check if getPostCreatedBuration is working', () {
        final myBirthday =
            DateTime.utc(2004, DateTime.june, 16, 5, 30, 0, 0, 0);
        final post = Post(
          creator: User(
            id: '123',
            firstName: 'John',
            lastName: 'Doe',
            email: 'test@test.com',
          ),
          sId: "sid",
          createdAt: myBirthday,
          description: 'test description',
          imageUrl: 'https://image.com',
          videoUrl: 'https://image.com',
          organization: OrgInfo(admins: users),
          likedBy: likeby,
          comments: comments,
        );
        post.getPostCreatedDuration();
      });
      test(
          'Check if getPostCreatedBuration work when time is less than 60 seconds',
          () {
        final myBirthday30 =
            DateTime.now().subtract(const Duration(seconds: 30));
        final post = Post(
          creator: User(
            id: '123',
            firstName: 'John',
            lastName: 'Doe',
            email: 'test@test.com',
          ),
          sId: "sid",
          createdAt: myBirthday30,
          description: 'test description',
          imageUrl: 'https://image.com',
          videoUrl: 'https://image.com',
          organization: OrgInfo(admins: users),
          likedBy: likeby,
          comments: comments,
        );
        post.getPostCreatedDuration();
      });
      test(
          'Check if getPostCreatedBuration work when time is less than 60 minutes',
          () {
        final myBirthday30 =
            DateTime.now().subtract(const Duration(minutes: 30));
        final post = Post(
          creator: User(
            id: '123',
            firstName: 'John',
            lastName: 'Doe',
            email: 'test@test.com',
          ),
          sId: "sid",
          createdAt: myBirthday30,
          description: 'test description',
          imageUrl: 'https://image.com',
          videoUrl: 'https://image.com',
          organization: OrgInfo(admins: users),
          likedBy: likeby,
          comments: comments,
        );
        post.getPostCreatedDuration();
      });
      test(
          'Check if getPostCreatedBuration work when time is less than 12 hours',
          () {
        final myBirthday12 = DateTime.now().subtract(const Duration(hours: 12));
        final post = Post(
          creator: User(
            id: '123',
            firstName: 'John',
            lastName: 'Doe',
            email: 'test@test.com',
          ),
          sId: "sid",
          createdAt: myBirthday12,
          description: 'test description',
          imageUrl: 'https://image.com',
          videoUrl: 'https://image.com',
          organization: OrgInfo(admins: users),
          likedBy: likeby,
          comments: comments,
        );
        post.getPostCreatedDuration();
      });
      test(
          'Check if getPostCreatedBuration work when time is less than 15 days',
          () {
        final myBirthday15 = DateTime.now().subtract(const Duration(days: 15));
        final post = Post(
          creator: User(
            id: '123',
            firstName: 'John',
            lastName: 'Doe',
            email: 'test@test.com',
          ),
          sId: "sid",
          createdAt: myBirthday15,
          description: 'test description',
          imageUrl: 'https://image.com',
          videoUrl: 'https://image.com',
          organization: OrgInfo(admins: users),
          likedBy: likeby,
          comments: comments,
        );
        post.getPostCreatedDuration();
      });
      test(
          'Check if getPostCreatedBuration work when time is less than 200 days',
          () {
        final myBirthday200 =
            DateTime.now().subtract(const Duration(days: 200));
        final post = Post(
          creator: User(
            id: '123',
            firstName: 'John',
            lastName: 'Doe',
            email: 'test@test.com',
          ),
          sId: "sid",
          createdAt: myBirthday200,
          description: 'test description',
          imageUrl: 'https://image.com',
          videoUrl: 'https://image.com',
          organization: OrgInfo(admins: users),
          likedBy: likeby,
          comments: comments,
        );
        post.getPostCreatedDuration();
      });
    });
    group('check if LikedBy toJson works', () {
      test('LikeBy model toJson', () {
        final likedBy = LikedBy(sId: "test");
        final likeByJson = {
          '_id': 'test',
        };
        expect(likedBy.toJson(), likeByJson);
      });
    });
    group('check if Comment toJson works', () {
      test('Comment model toJson', () {
        final comment = Comments(sId: 'test');
        final commentJson = {
          '_id': 'test',
        };
        expect(comment.toJson(), commentJson);
      });
    });
  });
}
