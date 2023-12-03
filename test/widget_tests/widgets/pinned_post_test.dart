import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';
import 'package:talawa/widgets/pinned_post.dart';
import '../../helpers/test_helpers.dart';

/// List of pinned posts.
///
///This file contains demo data for pinned posts. It contains a list of type Map<String, Object> and sample data.
const pinnedPostsDemoData = [
  {
    "_id": "1",
    "text": "church meeting",
    "createdAt": "2023-03-15T15:28:52.122Z",
    "imageUrl": "",
    "creator": {
      "firstName": "Rutvik",
      "lastName": "Chandla",
      "id": "asdasdasd",
    },
    "likedBy": [
      {"firstName": "User", "lastName": "1", "id": "asdasdasdas"},
      {"firstName": "User", "lastName": "2", "id": "asdasdasdas"},
      {"firstName": "User", "lastName": "3", "id": "asdasdasdas"},
    ],
    "comments": [
      {
        "text": "This is the posted comment",
        "creator": {"firstName": "User", "lastName": "4", "id": "asdasdasdas"},
      },
      {
        "text": "This is the posted comment",
        "creator": {"firstName": "User", "lastName": "4", "id": "asdasdasdas"},
      },
      {
        "text": "This is the posted comment",
        "creator": {"firstName": "User", "lastName": "4", "id": "asdasdasdas"},
      },
      {
        "text": "This is the posted comment",
        "creator": {"firstName": "User", "lastName": "4", "id": "asdasdasdas"},
      },
      {
        "text": "This is the posted comment",
        "creator": {"firstName": "User", "lastName": "4", "id": "asdasdasdas"},
      },
    ],
  },
];

///List of pinned post.
List<Post> _pinnedPosts =
    pinnedPostsDemoData.map((e) => Post.fromJson(e)).toList();

/// getter for pinned post.
///
/// **params**:

List<Post> get pinnedPosts {
  return _pinnedPosts;
}

/// main function.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  locator<SizeConfig>().test();
  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });
  tearDown(() {
    unregisterServices();
  });

  testWidgets('If container is coming on calling pinnedwidget',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byKey(const Key('hello')), findsOneWidget);
  });

  testWidgets('Text widget is present when there are pinned posts',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byType(Text), findsWidgets);
  });

  testWidgets('Text widget displays the correct text', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.text('church meeting'), findsOneWidget);
  });

  testWidgets('Tapping on a post triggers navigation', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );
    await widgetTester.pump();
    await widgetTester.tap(find.byType(GestureDetector));
    await widgetTester.pumpAndSettle();
    expect(find.byType(PinnedPost), findsNothing);
    expect(find.byType(PinnedPostScreen), findsOneWidget);
  });

  testWidgets('Container comes if list is empty', (widgetTester) async {
    await widgetTester.pumpWidget(
      const PinnedPost(pinnedPost: []),
    );
    await widgetTester.pump();
    expect(find.byKey(const Key('hi')), findsOneWidget);
  });
testWidgets('finds CircularProgressIndicator', (WidgetTester tester) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(const MaterialApp(
    home: Scaffold(
      body: CircularProgressIndicator(),
    ),
  ),);
  await tester.pump(const Duration(seconds: 5));
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});
}
