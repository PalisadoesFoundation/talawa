import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/model/comment.dart';

void main() async {
  group('Comment Model', () {
    test('Check individual values', () async {
      CommentModel _commentModel = CommentModel("id123", "test123");
      expect(_commentModel.postId, 'id123');
      expect(_commentModel.comment.runtimeType, equals(String));
      expect(_commentModel.comment, isNotNull);
    });
  });
}