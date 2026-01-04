import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/widgets/post_container.dart';

void main() {
  group('PostContainer', () {
    testWidgets('renders nothing if attachments are empty', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PostContainer(fileAttachmentList: []),
        ),
      );
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(PageView), findsNothing);
      expect(find.byType(Column), findsNothing);
    });

    testWidgets('renders nothing if fileAttachmentList is null',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PostContainer(fileAttachmentList: null),
        ),
      );
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(PageView), findsNothing);
    });

    testWidgets('does not show indicator dots for single attachment',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/image.jpg',
                mimetype: 'image/jpeg',
              ),
            ],
          ),
        ),
      );

      // Verify no indicator dots are shown
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.decoration is BoxDecoration &&
              (widget.decoration! as BoxDecoration).shape == BoxShape.circle,
        ),
        findsNothing,
      );
    });

    testWidgets('shows indicator dots for multiple attachments',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/image1.jpg',
                mimetype: 'image/jpeg',
              ),
              AttachmentModel(
                url: 'https://example.com/image2.jpg',
                mimetype: 'image/jpeg',
              ),
            ],
          ),
        ),
      );
      // There should be 2 indicator dots (circle containers)
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.decoration is BoxDecoration &&
              (widget.decoration! as BoxDecoration).shape == BoxShape.circle,
        ),
        findsNWidgets(2),
      );
    });

    testWidgets('handles null URL in image attachment', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: null,
                mimetype: 'image/jpeg',
              ),
            ],
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(CachedNetworkImage), findsOneWidget);

      final cachedImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(cachedImage.imageUrl, isEmpty);
    });

    testWidgets('handles null mimetype', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/file',
                mimetype: null,
              ),
            ],
          ),
        ),
      );

      expect(find.text('MIME type is not available '), findsOneWidget);
    });

    testWidgets('renders SizedBox for invalid MIME type', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/file.unknown',
                mimetype: 'invalid/mimetype',
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final pageViewFinder = find.byType(PageView);

      final sizedBoxInPageView = find.descendant(
        of: pageViewFinder,
        matching: find.byType(SizedBox),
      );

      expect(sizedBoxInPageView, findsOneWidget);
    });

    testWidgets('renders SizedBox for video MIME type', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/file.mp4',
                mimetype: 'video/mp4',
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final pageViewFinder = find.byType(PageView);

      final sizedBoxInPageView = find.descendant(
        of: pageViewFinder,
        matching: find.byType(SizedBox),
      );

      expect(sizedBoxInPageView, findsOneWidget);
    });

    testWidgets('PageView onPageChanged updates pindex correctly',
        (tester) async {
      // Arrange
      final attachments = [
        AttachmentModel(
          url: 'https://example.com/image1.jpg',
          mimetype: 'image/jpeg',
        ),
        AttachmentModel(
          url: 'https://example.com/image2.jpg',
          mimetype: 'image/jpeg',
        ),
        AttachmentModel(
          url: 'https://example.com/image3.jpg',
          mimetype: 'image/jpeg',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostContainer(fileAttachmentList: attachments),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Initially first page indicator should be active (primary color)
      expect(
        find.byType(Container),
        findsWidgets,
      );

      // Act - Swipe to next page with sufficient distance
      final pageViewFinder = find.byType(PageView);
      expect(pageViewFinder, findsOneWidget);

      await tester.drag(pageViewFinder, const Offset(-400, 0));
      await tester.pumpAndSettle();

      // Assert - Verify we're now on a different page by checking indicators
      final containers = tester.widgetList<Container>(find.byType(Container));
      final indicators = containers
          .where(
            (container) =>
                container.decoration is BoxDecoration &&
                (container.decoration! as BoxDecoration).shape ==
                    BoxShape.circle,
          )
          .toList();

      expect(indicators.length, equals(3));

      // Verify that onPageChanged was called by checking active indicator color
      // At least one indicator should have a non-grey color (the active one)
      final activeIndicators = indicators
          .where(
            (indicator) =>
                (indicator.decoration! as BoxDecoration).color != Colors.grey,
          )
          .toList();

      expect(activeIndicators.length, equals(1));
    });

    testWidgets('errorWidget callback is invoked and returns correct widget',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/image.jpg',
                mimetype: 'image/jpeg',
              ),
            ],
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Get the CachedNetworkImage widget
      final cachedImageFinder = find.byType(CachedNetworkImage);
      expect(cachedImageFinder, findsOneWidget);

      final cachedImage = tester.widget<CachedNetworkImage>(cachedImageFinder);
      expect(cachedImage.errorWidget, isNotNull);

      // Get a valid BuildContext from the widget tree
      final elementFinder = tester.element(cachedImageFinder);

      // Directly invoke the errorWidget callback with test parameters
      final errorWidget = cachedImage.errorWidget!(
        elementFinder,
        'https://example.com/image.jpg',
        Exception('Image load failed'),
      );

      // Verify it returns a Center widget
      expect(errorWidget, isA<Center>());

      // Create a test widget to verify the error widget renders correctly
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: errorWidget,
          ),
        ),
      );

      // Verify the broken image icon is present
      expect(find.byIcon(Icons.broken_image), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('swipe right to previous page triggers onPageChanged',
        (tester) async {
      final attachments = [
        AttachmentModel(
          url: 'https://example.com/image1.jpg',
          mimetype: 'image/jpeg',
        ),
        AttachmentModel(
          url: 'https://example.com/image2.jpg',
          mimetype: 'image/jpeg',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostContainer(fileAttachmentList: attachments),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Get PageView and indicator dots
      final pageView = find.byType(PageView);
      expect(pageView, findsOneWidget);

      // Initially, first indicator should be active (primary color)
      var containers = tester.widgetList<Container>(find.byType(Container));
      var indicators = containers
          .where(
            (container) =>
                container.decoration is BoxDecoration &&
                (container.decoration! as BoxDecoration).shape ==
                    BoxShape.circle,
          )
          .toList();
      expect(indicators.length, equals(2));

      // Verify first indicator is active initially
      final firstIndicatorColorInitial =
          (indicators[0].decoration! as BoxDecoration).color;
      expect(firstIndicatorColorInitial, isNot(Colors.grey));

      final secondIndicatorColorInitial =
          (indicators[1].decoration! as BoxDecoration).color;
      expect(secondIndicatorColorInitial, equals(Colors.grey));

      // Drag left to go to next page
      await tester.drag(pageView, const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Verify second indicator is now active
      containers = tester.widgetList<Container>(find.byType(Container));
      indicators = containers
          .where(
            (container) =>
                container.decoration is BoxDecoration &&
                (container.decoration! as BoxDecoration).shape ==
                    BoxShape.circle,
          )
          .toList();

      final firstIndicatorColorAfterSwipe =
          (indicators[0].decoration! as BoxDecoration).color;
      expect(firstIndicatorColorAfterSwipe, equals(Colors.grey));

      final secondIndicatorColorAfterSwipe =
          (indicators[1].decoration! as BoxDecoration).color;
      expect(secondIndicatorColorAfterSwipe, isNot(Colors.grey));

      // Drag right to go back to previous page
      await tester.drag(pageView, const Offset(500, 0));
      await tester.pumpAndSettle();

      // Verify first indicator is active (we're back on first page)
      containers = tester.widgetList<Container>(find.byType(Container));
      indicators = containers
          .where(
            (container) =>
                container.decoration is BoxDecoration &&
                (container.decoration! as BoxDecoration).shape ==
                    BoxShape.circle,
          )
          .toList();

      final firstIndicatorColor =
          (indicators[0].decoration! as BoxDecoration).color;
      expect(firstIndicatorColor, isNot(Colors.grey));

      final secondIndicatorColor =
          (indicators[1].decoration! as BoxDecoration).color;
      expect(secondIndicatorColor, equals(Colors.grey));
    });
  });
}
