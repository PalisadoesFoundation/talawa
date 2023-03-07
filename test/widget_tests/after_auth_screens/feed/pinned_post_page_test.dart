// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_page.dart';
import 'package:talawa/widgets/post_list_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../helpers/test_helpers.dart';

Widget createPinnedPostPage() {
  return MaterialApp(
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: PinnedPostPage(
      pinnedPosts: [
        Post(
          sId: 'post1',
          creator: User(firstName: 'firstName1'),
          createdAt: DateTime.now(),
          description: 'description1',
          comments: [],
        ),
      ],
    ),
  );
}

void main() {
  setUp(() {
    registerServices();
    registerViewModels();
  });

  group('Tests for pinned post page', () {
    testWidgets('Check whether PinnedPostPage shows up', (tester) async {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;

      await tester.pumpWidget(createPinnedPostPage());
      await tester.pump();

      expect(find.byType(PinnedPostPage), findsOneWidget);
      expect(find.byType(PostListWidget), findsOneWidget);
    });
  });
}
