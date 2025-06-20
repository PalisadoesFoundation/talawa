import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';
import 'package:talawa/widgets/pinned_post.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

/// main function.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  late List<Post> pinnedPosts;
  setUpAll(() {
    pinnedPosts = [
      Post(
        id: '1',
        caption: 'Church Meeting',
        attachments: [
          AttachmentModel(
            url:
                'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
          ),
        ],
        createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
      ),
      Post(
        id: '2',
        caption: 'Russia-Ukraine war leads to Hike in Gas prices in Europe.',
        attachments: [
          AttachmentModel(
            url:
                'https://gdb.voanews.com/3B960F7F-786C-452C-8ABD-9D5AEEAED9D9.jpg',
          ),
        ],
        createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
      ),
    ];
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<SizeConfig>().test();
    registerServices();
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
          fetchNextPinnedPosts: () {},
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
          fetchNextPinnedPosts: () {},
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
          fetchNextPinnedPosts: () {},
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
          fetchNextPinnedPosts: () {},
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
        home: PinnedPost(
          pinnedPost: [],
          model: mainScreenViewModel,
          fetchNextPinnedPosts: () {},
        ),
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
          fetchNextPinnedPosts: () {},
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
          fetchNextPinnedPosts: () {},
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
          fetchNextPinnedPosts: () {},
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CachedNetworkImage &&
            widget.imageUrl == pinnedPosts[0].attachments![0].url,
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
          fetchNextPinnedPosts: () {},
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));

    final imageWidget = find.byWidgetPredicate(
      (widget) =>
          widget is CachedNetworkImage &&
          widget.imageUrl == pinnedPosts[0].attachments![0].url,
    );

    expect(imageWidget, findsOneWidget);
  });
}
