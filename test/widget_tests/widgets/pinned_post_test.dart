import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';
import 'package:talawa/widgets/pinned_post.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

/// List of pinned posts.
///
/// This file contains demo data for pinned posts. It contains a list of type `Map<String, Object>` and sample data.
const pinnedPostsDemoData = [
  {
    "_id": "1",
    "text": "church meeting",
    "createdAt": "2023-03-15T15:28:52.122Z",
    "imageUrl":
        "https://imgs.search.brave.com/OHazbRf4oO5wuydAbr6061fUGuEw-rlDB1SuXWnJgTo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzZiLzIy/L2JhLzZiMjJiYTg2/Yzk3NjBiMzQ4YjNh/NTMzOGFjMzI4ZmJm/LmpwZw",
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
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<SizeConfig>().test();
    registerServices();
    locator<SizeConfig>().test();
  });
  tearDownAll(() {
    unregisterServices();
  });

  testWidgets('If container is coming on calling pinnedwidget',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));
    expect(find.byKey(const Key('hello')), findsOneWidget);
  });

  testWidgets('Text widget is present when there are pinned posts',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));
    expect(find.byType(Text), findsWidgets);
  });

  testWidgets('Text widget displays the correct text', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));
    expect(find.text('church meeting'), findsOneWidget);
  });

  testWidgets('Tapping on a post triggers navigation', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));

    await widgetTester.tap(find.byType(GestureDetector));
    await widgetTester.pumpAndSettle();
    expect(find.byType(PinnedPost), findsNothing);
    expect(find.byType(PinnedPostScreen), findsOneWidget);
  });

  testWidgets('Container comes if list is empty', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: [], model: mainScreenViewModel),
      ),
    );
    await widgetTester.pump();
    expect(find.byKey(const Key('hi')), findsOneWidget);
  });
  testWidgets('Error widget is displayed when image fails to load',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));

    expect(
      find.byWidgetPredicate(
        (widget) => widget is CachedNetworkImage && widget.errorWidget != null,
      ),
      findsOneWidget,
    );
  });

  testWidgets('CircularProgressIndicator is shown when image fails to load',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );

    await widgetTester.pump(const Duration(seconds: 5));

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CachedNetworkImage &&
            widget.errorWidget != null &&
            widget.errorWidget is Function &&
            widget.errorWidget!(
              widgetTester.binding.rootElement!,
              '',
              Exception(),
            ) is SizedBox,
      ),
      findsOneWidget,
    );
  });
  testWidgets('CachedNetworkImage displays correct image',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CachedNetworkImage &&
            widget.imageUrl == pinnedPosts[0].imageUrl,
      ),
      findsOneWidget,
    );
  });

  testWidgets('CachedNetworkImage displays correct image',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
          model: mainScreenViewModel,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));

    final imageWidget = find.byWidgetPredicate(
      (widget) =>
          widget is CachedNetworkImage &&
          widget.imageUrl == pinnedPosts[0].imageUrl,
    );

    expect(imageWidget, findsOneWidget);
  });
}
