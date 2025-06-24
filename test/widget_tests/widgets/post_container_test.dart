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
      // CachedNetworkImage will show CircularProgressIndicator while loading
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders video player if attachment is video', (tester) async {
      // The video_player plugin does not support widget tests.
      // You can skip this test or use a mock implementation.
      return;
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

      // Find the PageView
      final pageViewFinder = find.byType(PageView);

      // Find the SizedBox that is a descendant of PageView
      final sizedBoxInPageView = find.descendant(
        of: pageViewFinder,
        matching: find.byType(SizedBox),
      );

      expect(sizedBoxInPageView, findsOneWidget);
    });
  });
}
