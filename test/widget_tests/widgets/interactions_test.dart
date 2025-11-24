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
  testWidgets('Downvote button displays correct icon and handles tap',
      (tester) async {
    // Arrange
    final testPost = Post(
      id: 'post123',
      downvotesCount: 3,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Interactions(
            post: testPost,
            redirectToIndividualPage: null,
          ),
        ),
      ),
    );

    // Verify downvote icon exists
    expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);

    // Act - tap the downvote button
    await tester.tap(find.byIcon(Icons.thumb_down_outlined));
    await tester.pumpAndSettle();

    /// The down vote button does not have any functionality right now,
    /// so we just check that the icon is present and no errors occur.
  });
  testWidgets('Upvote button displays correct icon and handles tap',
      (tester) async {
    // Arrange
    final testPost = Post(
      id: 'post123',
      downvotesCount: 3,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Interactions(
            post: testPost,
            redirectToIndividualPage: null,
          ),
        ),
      ),
    );

    // Verify upvote icon exists
    expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);

    // Act - tap the upvote button
    await tester.tap(find.byIcon(Icons.thumb_up_outlined));
    await tester.pumpAndSettle();

    /// The up vote button does not have any functionality right now,
    /// so we just check that the icon is present and no errors occur.
  });
}
