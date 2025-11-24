import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
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

  testWidgets('Text widget is present when there are pinned posts',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
        ),
      ),
    );
    await widgetTester.pump(const Duration(seconds: 5));
    expect(find.byType(Text), findsWidgets);
  });

  testWidgets('Container comes if list is empty', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: PinnedPost(
          pinnedPost: [],
        ),
      ),
    );
    await widgetTester.pump();
    expect(find.byKey(const Key('hi')), findsOneWidget);
  });

  testWidgets('CachedNetworkImage displays correct image',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
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

  testWidgets('GestureDetector exists and is tappable', (tester) async {
    final posts = [
      Post(id: 'post1', caption: 'Test Caption', attachments: []),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PinnedPost(pinnedPost: posts),
        ),
      ),
    );

    // Verify GestureDetector exists
    expect(find.byKey(const Key('GestureDetectorPinnedPost0')), findsOneWidget);

    // Verify it's a GestureDetector
    expect(find.byType(GestureDetector), findsOneWidget);
  });
  testWidgets('GestureDetector navigates using tapAt', (tester) async {
    final posts = [
      Post(id: 'post1', caption: 'First Post'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PinnedPost(pinnedPost: posts),
        ),
      ),
    );

    // Get the center of the widget and tap there
    final gestureDetector = tester.widget<GestureDetector>(
      find.byKey(const Key('GestureDetectorPinnedPost0')),
    );

    // Manually call the onTap function
    gestureDetector.onTap!();
    await tester.pumpAndSettle();

    verify(
      navigationService.pushScreen(
        Routes.pinnedPostScreen,
        arguments: anyNamed('arguments'),
      ),
    ).called(1);
  });
}
