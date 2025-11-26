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
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );

    await widgetTester.pumpAndSettle();
    expect(find.byType(Text), findsWidgets);
  });

  testWidgets('Container comes if list is empty', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: PinnedPost(pinnedPost: []),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byKey(const Key('hi')), findsOneWidget);
  });

  testWidgets('CachedNetworkImage displays correct image',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );

    await widgetTester.pumpAndSettle();

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

    expect(find.byKey(const Key('GestureDetectorPinnedPost0')), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
  });

  testWidgets('should handle null attachment url', (tester) async {
    final post = Post(
      id: '123',
      attachments: [AttachmentModel(url: null)],
      caption: 'Sample Caption',
    );

    await tester.pumpWidget(
      MaterialApp(home: PinnedPost(pinnedPost: [post])),
    );

    await tester.pumpAndSettle();

    expect(find.byType(CachedNetworkImage), findsOneWidget);

    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

    expect(cachedImage.imageUrl, '');
  });

  testWidgets('should handle empty attachments list', (tester) async {
    final post = Post(
      id: '456',
      attachments: [],
      caption: 'Test Caption',
    );

    await tester.pumpWidget(
      MaterialApp(home: PinnedPost(pinnedPost: [post])),
    );

    await tester.pumpAndSettle();

    expect(find.byType(CachedNetworkImage), findsOneWidget);

    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

    expect(cachedImage.imageUrl, '');
  });

  testWidgets('should handle null attachments', (tester) async {
    final post = Post(
      id: '789',
      attachments: null,
      caption: 'Test Caption',
    );

    await tester.pumpWidget(
      MaterialApp(home: PinnedPost(pinnedPost: [post])),
    );

    await tester.pumpAndSettle();

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
      MaterialApp(home: PinnedPost(pinnedPost: [post])),
    );

    await tester.pumpAndSettle();

    final cachedImageFinder = find.byType(CachedNetworkImage);
    final cachedImage = tester.widget<CachedNetworkImage>(cachedImageFinder);

    expect(cachedImage.errorWidget, isNotNull);

    final errorWidget = cachedImage.errorWidget!(
      tester.element(cachedImageFinder),
      '',
      Object(),
    );

    expect(errorWidget, isA<Center>());

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
      caption: null,
    );

    await tester.pumpWidget(
      MaterialApp(home: PinnedPost(pinnedPost: [post])),
    );

    await tester.pumpAndSettle();

    // Find the specific Text widget that displays the caption
    final captionFinder = find.byWidgetPredicate(
      (widget) => widget is Text && (widget.data == '' || widget.data == null),
    );

    expect(captionFinder, findsAtLeast(1));
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
      ),
      Post(id: 'post3', caption: 'Third Post', attachments: []),
    ];

    await tester.pumpWidget(
      MaterialApp(home: PinnedPost(pinnedPost: multiplePosts)),
    );

    await tester.pumpAndSettle();

    expect(find.byType(GestureDetector), findsNWidgets(3));
  });

  testWidgets('should verify ListView properties', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: PinnedPost(pinnedPost: pinnedPosts)),
    );

    await tester.pumpAndSettle();

    final listView = tester.widget<ListView>(find.byType(ListView));

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
      MaterialApp(home: PinnedPost(pinnedPost: [post])),
    );

    await tester.pumpAndSettle();

    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

    expect(cachedImage.cacheKey, 'unique-id-123');
  });

  testWidgets('GestureDetector navigates using tapAt', (tester) async {
    final posts = [
      Post(
        id: 'post1',
        caption: 'First Post',
        attachments: [
          AttachmentModel(
            url: 'https://example.com/image.jpg',
          ),
        ],
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: PinnedPost(pinnedPost: posts)),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('First Post'));
    await tester.pumpAndSettle();

    verify(
      navigationService.pushScreen(
        Routes.pinnedPostScreen,
        arguments: anyNamed('arguments'),
      ),
    ).called(1);
  });

  testWidgets(
      'should display pinned duration text from getPostPinnedDuration()',
      (tester) async {
    final fixedDateTime = DateTime.utc(2020, 1, 1, 12, 0, 0);
    final post = Post(
      id: 'duration-test',
      caption: 'Test Caption',
      attachments: [
        AttachmentModel(
          url: 'https://example.com/image.jpg',
        ),
      ],
      pinnedAt: fixedDateTime,
    );

    await tester.pumpWidget(
      MaterialApp(home: PinnedPost(pinnedPost: [post])),
    );

    await tester.pumpAndSettle();

    final durationText = post.getPostPinnedDuration();
    final textWidgets = tester.widgetList<Text>(find.byType(Text));
    final hasDurationText =
        textWidgets.any((text) => text.data == durationText);

    expect(hasDurationText, isTrue);
  });
}
