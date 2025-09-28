import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/widgets/interaction.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() {
    registerServices();
    registerViewModels();
  });
  tearDownAll(() {
    unregisterViewModels();
    unregisterServices();
  });
  testWidgets('Comment button calls redirectToIndividualPage with correct post',
      (tester) async {
    // Arrange
    bool callbackCalled = false;
    Post? passedPost;

    final testPost = Post(
      id: 'post123',
      caption: 'Test caption',
      commentsCount: 5,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Interactions(
            post: testPost,
            redirectToIndividualPage: (post) {
              callbackCalled = true;
              passedPost = post;
            },
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byIcon(Icons.comment_outlined));
    await tester.pumpAndSettle();

    // Assert
    expect(callbackCalled, isTrue);
    expect(passedPost, isNotNull);
    expect(passedPost?.id, equals('post123'));
    expect(identical(passedPost, testPost), isTrue);
  });
}
