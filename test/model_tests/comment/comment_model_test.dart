import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/user/user_info.dart';

/// Creates Comment from test JSON with proper nested user handling.
///
/// **Purpose:**
/// Constructs a Comment instance from test JSON data, specifically handling
/// the nested creator structure. This helper function is designed for test
/// scenarios where we need to parse comment data with user information
/// embedded in the creator field.
///
/// **Implementation Details:**
/// - Extracts user data from nested creator structures for proper Comment creation
/// - Omits the `fromOrg: true` parameter when calling `User.fromJson` to simplify
///   user creation for testing purposes and avoid dependencies on organizational context
/// - Uses the standard user parsing flow (non-organization) which expects nested
///   user data structure with authentication tokens, making it suitable for
///   general comment parsing scenarios in tests
/// - Handles null creator gracefully to support test cases with missing user data
///
/// **params**:
/// * `json`: Map containing the test JSON data with nested creator structure
///           Expected format: {'creator': {'user': {...}, 'authenticationToken': '...'}, ...}
///
/// **returns**:
/// * `Comment`: Properly constructed Comment instance with extracted creator data
Comment commentFromJsonTest(Map<String, dynamic> json) {
  return Comment(
    text: json['text'] as String?,
    createdAt: json['createdAt'] as String?,
    creator: json['creator'] == null
        ? null
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
          ), // fromOrg: true omitted for simplified test user creation
    post: json['post'] as String?,
    likeCount: json['likeCount'] as String?,
  );
}

void main() {
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
      'user': {
        'id': '123',
        'name': 'John Doe',
        'emailAddress': 'test@test.com',
        'avatarURL': null,
      },
      'authenticationToken': 'authToken123',
    },
    'createdAt': '123456',
    'text': 'test text',
    'post': 'test post',
    'likeCount': 'test count',
  };
  group('Test Comment model', () {
    test('Test task json', () {
      final commentFromJson = commentFromJsonTest(commentJson);
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
