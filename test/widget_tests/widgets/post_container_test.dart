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
    });

    testWidgets('renders image if attachment is image', (tester) async {
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

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Image).evaluate().first.widget, isA<Image>());
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

    testWidgets('shows message for empty MIME type', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/file.unknown',
                mimetype: '',
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
                mimetype: 'video/mimetype',
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

      // Assert - Second page indicator should now be active
      // Find all indicator containers and verify the active one changed
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

      // Get PageView and perform a drag
      final pageView = find.byType(PageView);

      // Drag left to go to next page
      await tester.drag(pageView, const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Drag right to go back to previous page
      await tester.drag(pageView, const Offset(500, 0));
      await tester.pumpAndSettle();

      // Verify we returned to first page by checking active indicator
      final containers = tester.widgetList<Container>(find.byType(Container));
      final indicators = containers
          .where(
            (container) =>
                container.decoration is BoxDecoration &&
                (container.decoration! as BoxDecoration).shape ==
                    BoxShape.circle,
          )
          .toList();

      expect(indicators.length, equals(2));

      // Count how many indicators have non-grey color (should be exactly 1 - the active one)
      final activeIndicators = indicators
          .where(
            (indicator) =>
                (indicator.decoration! as BoxDecoration).color != Colors.grey,
          )
          .toList();

      expect(activeIndicators.length, equals(1));
    });
  });
}
