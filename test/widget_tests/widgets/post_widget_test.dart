import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/widgets/caption_text_widget.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/interaction.dart';
import 'package:talawa/widgets/post_container.dart';
import 'package:talawa/widgets/post_modal.dart';
import 'package:talawa/widgets/post_widget.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('PostWidget Tests', () {
    late Post testPost;
    late Post postWithAttachments;
    late Post postWithoutCreator;
    setUpAll(() {
      registerServices();
      registerViewModels();
    });
    tearDownAll(() {
      unregisterViewModels();
      unregisterServices();
    });

    setUp(() {
      testPost = Post(
        id: 'post1',
        caption: 'Test caption',
        creator: User(
          firstName: 'John',
          lastName: 'Doe',
          image: null,
        ),
        attachments: null,
      );

      postWithAttachments = Post(
        id: 'post2',
        caption: 'Post with attachments',
        creator: User(
          firstName: 'Jane',
          lastName: 'Smith',
          image: 'https://example.com/image.jpg',
        ),
        attachments: [
          AttachmentModel(url: 'https://example.com/attachment.jpg'),
        ],
      );

      postWithoutCreator = Post(
        id: 'post3',
        caption: 'Post without creator',
        creator: null,
      );
    });

    testWidgets('PostWidget displays basic post structure', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: testPost),
          ),
        ),
      );

      // Verify basic structure
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(CustomAvatar), findsOneWidget);
      expect(find.byKey(const Key('postContainergestureDetector')),
          findsOneWidget);
      expect(find.byType(Interactions), findsOneWidget);
    });

    testWidgets('PostWidget displays creator information correctly',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: testPost),
          ),
        ),
      );

      // Verify creator name
      expect(find.text('John Doe'), findsOneWidget);

      // Verify CustomAvatar receives correct props
      final avatar = tester.widget<CustomAvatar>(find.byType(CustomAvatar));
      expect(avatar.isImageNull, isTrue);
      expect(avatar.firstAlphabet, equals('J'));
      expect(avatar.fontSize, equals(20));
    });

    testWidgets('PostWidget displays creator with image correctly',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: postWithAttachments),
          ),
        ),
      );

      // Verify creator name
      expect(find.text('Jane Smith'), findsOneWidget);

      // Verify CustomAvatar receives correct props
      final avatar = tester.widget<CustomAvatar>(find.byType(CustomAvatar));
      expect(avatar.isImageNull, isFalse);
      expect(avatar.imageUrl, equals('https://example.com/image.jpg'));
    });

    testWidgets('PostWidget handles creator with null values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: postWithoutCreator),
          ),
        ),
      );

      // Should handle null creator gracefully
      expect(find.text('null null'), findsOneWidget);

      final avatar = tester.widget<CustomAvatar>(find.byType(CustomAvatar));
      expect(avatar.isImageNull, isTrue);
      expect(avatar.firstAlphabet, isNull);
    });

    testWidgets('PostWidget shows report button and opens modal',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: testPost),
          ),
        ),
      );

      // Verify report button exists
      expect(find.byKey(const Key('reportButton')), findsOneWidget);
      expect(find.byIcon(Icons.report_gmailerrorred_outlined), findsOneWidget);

      // Tap report button (use the correct key)
      await tester.tap(find.byKey(const Key('reportButton')));
      await tester.pumpAndSettle();

      // Verify modal appears
      expect(find.byKey(const Key('reportPost')), findsOneWidget);
      expect(find.byType(PostBottomModal), findsOneWidget);
    });

    testWidgets('PostWidget displays caption when no attachments',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: testPost),
          ),
        ),
      );

      // Should show CaptionTextWidget when no attachments
      expect(find.byType(CaptionTextWidget), findsOneWidget);
      expect(find.text('Test caption'), findsOneWidget);
      expect(find.byType(PostContainer), findsNothing);
    });

    testWidgets('PostWidget displays attachments when present', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: postWithAttachments),
          ),
        ),
      );

      // Should show PostContainer when attachments exist
      expect(find.byType(PostContainer), findsOneWidget);

      // Should also show caption below (in the Row)
      expect(find.byType(CaptionTextWidget), findsOneWidget);
    });

    testWidgets('PostWidget handles GestureDetector tap', (tester) async {
      bool redirectCalled = false;
      Post? redirectedPost;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(
              post: testPost,
              redirectToIndividualPage: (post) {
                redirectCalled = true;
                redirectedPost = post;
              },
            ),
          ),
        ),
      );

      final gestureDetecor =
          find.byKey(const Key('postContainergestureDetector'));

      // Tap the GestureDetector
      await tester.tap(gestureDetecor);
      await tester.pumpAndSettle();

      // Verify callback was called
      expect(redirectCalled, isTrue);
      expect(redirectedPost?.id, equals('post1'));
    });

    testWidgets('PostWidget passes correct props to Interactions',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(
              post: testPost,
              redirectToIndividualPage: (post) {},
            ),
          ),
        ),
      );

      // Verify Interactions widget receives correct props
      final interactions =
          tester.widget<Interactions>(find.byType(Interactions));
      expect(interactions.post.id, equals('post1'));
      expect(interactions.redirectToIndividualPage, isNotNull);
    });

    testWidgets('PostWidget handles deletePost callback', (tester) async {
      bool deleteCalled = false;
      Post? deletedPost;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(
              post: testPost,
              deletePost: (post) {
                deleteCalled = true;
                deletedPost = post;
              },
            ),
          ),
        ),
      );

      // Open modal
      await tester.tap(find.byKey(const Key('reportButton')));
      await tester.pumpAndSettle();

      // Tap delete button if available
      if (find.text('Delete Post').evaluate().isNotEmpty) {
        await tester.tap(find.text('Delete Post'));
        await tester.pumpAndSettle();

        expect(deleteCalled, isTrue);
        expect(deletedPost?.id, equals('post1'));
      }
    });

    testWidgets('PostWidget applies correct styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: PostWidget(post: testPost),
          ),
        ),
      );

      // Verify Card styling
      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, equals(5));
      expect(card.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('PostWidget handles empty caption', (tester) async {
      final postWithEmptyCaption = Post(
        id: 'post4',
        caption: null,
        creator: testPost.creator,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: postWithEmptyCaption),
          ),
        ),
      );

      // Should handle empty caption gracefully
      expect(find.byType(CaptionTextWidget), findsOneWidget);
      expect(find.text(''), findsOneWidget);
    });

    testWidgets('PostWidget modal can be dismissed', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostWidget(post: testPost),
          ),
        ),
      );

      // Open modal
      await tester.tap(find.byKey(const Key('reportButton')));
      await tester.pumpAndSettle();

      // Verify modal is open
      expect(find.byKey(const Key('reportPostButton')), findsOneWidget);

      // Tap outside to dismiss (or use back button)
      await tester.tapAt(const Offset(50, 50));
      await tester.pumpAndSettle();

      // Verify modal is closed
      expect(find.byKey(const Key('reportPostButton')), findsNothing);
    });
  });
}
