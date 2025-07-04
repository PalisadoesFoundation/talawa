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
        find.byWidgetPredicate((widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration! as BoxDecoration).shape == BoxShape.circle),
        findsNWidgets(2),
      );
    });
    testWidgets('shows message for invalid/empty MIME type', (tester) async {
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

    testWidgets('shows message for invalid/empty MIME type', (tester) async {
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
    testWidgets('shows message for invalid/empty MIME type', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostContainer(
            fileAttachmentList: [
              AttachmentModel(
                url: 'https://example.com/file.unknown',
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
            url: 'https://example.com/image1.jpg', mimetype: 'image/jpeg'),
        AttachmentModel(
            url: 'https://example.com/image2.jpg', mimetype: 'image/jpeg'),
        AttachmentModel(
            url: 'https://example.com/image3.jpg', mimetype: 'image/jpeg'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostContainer(fileAttachmentList: attachments),
          ),
        ),
      );

      // Initially first page indicator should be active (primary color)
      expect(find.byType(Container),
          findsNWidgets(4)); // 3 indicators + 1 main container

      // Act - Swipe to next page
      await tester.drag(find.byType(PageView), const Offset(-300, 0));
      await tester.pumpAndSettle();

      // Assert - Second page indicator should now be active
      // Find all indicator containers and verify the active one changed
      final containers = tester.widgetList<Container>(find.byType(Container));
      final indicators = containers
          .where((container) =>
              container.decoration is BoxDecoration &&
              (container.decoration! as BoxDecoration).shape == BoxShape.circle)
          .toList();

      expect(indicators.length, equals(3));

      // Verify pindex was updated by checking active indicator
      // The second indicator should now have primary color
      expect(
          find.byWidgetPredicate((widget) =>
              widget is Container &&
              widget.decoration is BoxDecoration &&
              (widget.decoration! as BoxDecoration).color != Colors.grey),
          findsOneWidget);
    });
  });
}
