// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  final Post mockPost = Post(
    sId: "1",
    creator: userConfig.currentUser,
    description: "mock post",
    imageUrl: "mockImageUrl",
    videoUrl: "mockVideoUrl",
    organization: userConfig.currentOrg,
    createdAt: DateTime.now(),
    comments: [],
  );

  group('Comments View Model Tests', () {
    test("Testing the functions", () async {
      /// first testing initialize function
      final model = CommentsViewModel();

      when(commentsService.getCommentsForPost(mockPost.sId))
          .thenAnswer((realInvocation) async {
        return [];
      });

      await model.initialise(mockPost.sId);
      expect(model.commentList, []);
      expect(model.postId, mockPost.sId);

      /// testing the get comments function
      final commentJson1 = {
        "text": "first comment",
        "post": mockPost.sId,
      };
      final commentJson2 = {
        "text": "second comment",
        "post": mockPost.sId,
      };

      final commentsJson = [commentJson1, commentJson2];

      final comment1 = Comment(
        text: "first comment",
        post: mockPost.sId,
      );
      final comment2 = Comment(
        text: "second comment",
        post: mockPost.sId,
      );
      final comments = [comment1, comment2];
      when(commentsService.getCommentsForPost(mockPost.sId))
          .thenAnswer((realInvocation) async {
        return commentsJson;
      });

      await model.getComments();

      expect(model.commentList.length, comments.length);
      expect(model.commentList.first.text, comment1.text);
      expect(model.commentList.first.post, mockPost.sId);
      expect(model.commentList.last.text, comment2.text);
      expect(model.commentList.last.post, mockPost.sId);

      /// finally testing the create comment function
      when(commentsService.getCommentsForPost(mockPost.sId))
          .thenAnswer((realInvocation) async {
        return [];
      });
      await model.initialise(mockPost.sId);

      when(commentsService.createComments(mockPost.sId, "fakeMsg"))
          .thenAnswer((realInvocation) async {});
      when(postService.addCommentLocally(mockPost.sId))
          .thenAnswer((realInvocation) {});

      await model.createComment("fakeMsg");

      expect(model.commentList.length, 1);
      expect(model.commentList.first.text, "fakeMsg");
      expect(model.commentList.first.creator!.id, "xzy1");
    });
  });
}
