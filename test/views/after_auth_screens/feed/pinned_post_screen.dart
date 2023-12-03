// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';
import '../../../helpers/test_locator.dart';

void main() {
  SizeConfig().test();
  testSetupLocator();

  TestWidgetsFlutterBinding.ensureInitialized();

  group('PinnedPostScreen -', () {
    testWidgets('Has Title and Time', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PinnedPostScreen(
            post: {
              'title': 'Sample Title',
              'time': '23:00',
              'postId': 'postId',
              'imageUrl': 'imageUrl',
            },
          ),
        ),
      );

      expect(find.text('Sample Title'), findsOneWidget);
      expect(find.text('23:00hr'), findsOneWidget);
    });
  });

  group('Cached Image -', () {
    testWidgets('Has Cached Image', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PinnedPostScreen(
            post: {
              'title': 'Sample Title',
              'time': '23:00',
              'postId': 'postId',
              'imageUrl': 'imageUrl',
            },
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
