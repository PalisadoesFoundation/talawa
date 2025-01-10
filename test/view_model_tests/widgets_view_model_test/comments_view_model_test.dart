// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  late Post mockPost;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    registerServices();

    mockPost = Post(
      sId: "1",
      creator: userConfig.currentUser,
      description: "mock post",
      imageUrl: "mockImageUrl",
      videoUrl: "mockVideoUrl",
      organization: userConfig.currentOrg,
      createdAt: DateTime.now(),
      comments: [],
    );
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('Comments View Model Tests', () {
    test("Testing the functions", () async {
      // Initialize CommentsViewModel
      final model = CommentsViewModel();

      // Mock commentsService.getCommentsForPost
      when(commentsService.getCommentsForPost(mockPost.sId))
          .thenAnswer((_) async => []);

      // Test initialise function
      await model.initialise(mockPost.sId);
      expect(model.commentList, []);
      expect(model.postId, mockPost.sId);

      // Mock comments for getComments
      final commentJson1 = {
        "text": "fakeMsg",
        "post": mockPost.sId,
        "creator": {"id": "creator1"},
      };
      final commentJson2 = {
        "text": "second comment",
        "post": mockPost.sId,
        "creator": {"id": "creator2"},
      };

      final commentsJson = [commentJson1, commentJson2];

      final comment1 = Comment.fromJson(commentJson1);
      final comment2 = Comment.fromJson(commentJson2);

      when(commentsService.getCommentsForPost(mockPost.sId))
          .thenAnswer((_) async => commentsJson);

      // Test getComments function
      await model.getComments();

      expect(model.commentList.length, 2);
      expect(model.commentList.first.text, comment1.text);
      expect(model.commentList.first.post, comment1.post);
      expect(model.commentList.last.text, comment2.text);
      expect(model.commentList.last.post, comment2.post);

      // Test createComment function
      when(commentsService.createComments(mockPost.sId, "fakeMsg"))
          .thenAnswer((_) async {});

      when(postService.addCommentLocally(mockPost.sId))
          .thenAnswer((_) async {});

// Simulate adding the comment manually for testing
      final newComment = Comment(
        text: "fakeMsg",
        post: mockPost.sId,
        creator: User(id: "xzy1"),
      );

      model.commentList.add(newComment);

      await model.createComment("fakeMsg");

// Verify the result
      expect(model.commentList.length, 4);
      expect(model.commentList.first.text, "fakeMsg");
    });
  });
}
