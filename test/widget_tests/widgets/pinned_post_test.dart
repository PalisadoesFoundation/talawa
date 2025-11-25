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
///
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
  testWidgets('should handle null attachment url', (tester) async {
    final post = Post(
      id: '123',
      attachments: [AttachmentModel(url: null)], // Null URL
      caption: 'Sample Caption',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: [post]),
      ),
    );

    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    // CachedNetworkImage widget should be present with empty URL
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedImage.imageUrl, '');
  });

  testWidgets('should handle empty attachments list', (tester) async {
    final post = Post(
      id: '456',
      attachments: [], // Empty attachments
      caption: 'Test Caption',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: [post]),
      ),
    );

    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    // CachedNetworkImage should be present with empty URL
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedImage.imageUrl, '');
  });

  testWidgets('should handle null attachments', (tester) async {
    final post = Post(
      id: '789',
      attachments: null, // Null attachments
      caption: 'Test Caption',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: [post]),
      ),
    );

    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    // CachedNetworkImage should be present with empty URL
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedImage.imageUrl, '');
  });

  testWidgets('should verify CachedNetworkImage errorWidget is configured',
      (tester) async {
    final post = Post(
      id: 'error-test',
      attachments: [AttachmentModel(url: 'invalid-url')],
      caption: 'Test',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: [post]),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

    // Verify errorWidget builder is configured
    expect(cachedImage.errorWidget, isNotNull);

    // Manually invoke the errorWidget builder
    final errorWidget = cachedImage.errorWidget!(
        tester.element(find.byType(PinnedPost)), '', Object());

    // Should be a Center widget
    expect(errorWidget, isA<Center>());

    // Cast to Center and verify its child is an Icon
    final centerWidget = errorWidget as Center;
    expect(centerWidget.child, isA<Icon>());
  });

  testWidgets('should display empty string when caption is null',
      (tester) async {
    final post = Post(
      id: 'caption-test',
      attachments: [
        AttachmentModel(
          url:
              'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
        ),
      ],
      caption: null, // Null caption
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: [post]),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    // Should directly verify at least one Text widget has empty string
    final textWidgets = tester.widgetList<Text>(find.byType(Text));

    final hasEmptyCaption =
        textWidgets.any((text) => text.data == '' || text.data == null);

    expect(hasEmptyCaption, isTrue,
        reason:
            'Expected at least one Text widget with empty data when caption is null.');
  });

  testWidgets('should handle multiple pinned posts correctly', (tester) async {
    final multiplePosts = [
      Post(
        id: 'post1',
        caption: 'First Post',
        attachments: [
          AttachmentModel(
            url:
                'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
          ),
        ],
        createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
      ),
      Post(
        id: 'post2',
        caption: 'Second Post',
        attachments: [
          AttachmentModel(
            url:
                'https://gdb.voanews.com/3B960F7F-786C-452C-8ABD-9D5AEEAED9D9.jpg',
          ),
        ],
        createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
      ),
      Post(
        id: 'post3',
        caption: 'Third Post',
        attachments: [],
        createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: multiplePosts),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    // Should find multiple GestureDetectors
    expect(
      find.byKey(const Key('GestureDetectorPinnedPost0')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('GestureDetectorPinnedPost1')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('GestureDetectorPinnedPost2')),
      findsOneWidget,
    );
  });

  testWidgets('should verify ListView properties', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(
          pinnedPost: pinnedPosts,
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    // Find ListView.builder widget
    final listView = tester.widget<ListView>(find.byType(ListView));

    // Verify ListView properties
    expect(listView.scrollDirection, Axis.horizontal);
    expect(listView.shrinkWrap, true);
    expect(listView.physics, isA<AlwaysScrollableScrollPhysics>());
  });

  testWidgets('should use correct cacheKey for CachedNetworkImage',
      (tester) async {
    final post = Post(
      id: 'unique-id-123',
      caption: 'Test',
      attachments: [
        AttachmentModel(
          url:
              'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: [post]),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

    // Verify the cacheKey is the post id
    expect(cachedImage.cacheKey, 'unique-id-123');
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
