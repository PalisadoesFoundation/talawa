// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';
import 'package:talawa/views/base_view.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createApp() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const PinnedPostScreen(
          post: {
            'title': 'Sample Title',
            'time': '23:00',
            'postId': 'postId',
            'imageUrl': 'imageUrl',
          },
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

Future<void> showPinnedPostScreen(WidgetTester tester) async {
  await tester.pumpWidget(createApp());
  await tester.pumpAndSettle();
}

void main() {
  testSetupLocator();

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  testWidgets('Check if Pinned Post Screen page shows up', (tester) async {
    await showPinnedPostScreen(tester);
    expect(find.byType(SafeArea), findsOneWidget);
  });

  group('Check if Pinned Post Screen page has -', () {
    testWidgets('Title', (tester) async {
      await showPinnedPostScreen(tester);
      expect(find.text('Sample Title'), findsOneWidget);
    });

    testWidgets('Time', (tester) async {
      await showPinnedPostScreen(tester);
      expect(find.text('23:00hr'), findsOneWidget);
    });
  });

  // Check if cached network image is working
  testWidgets('Check if CachedNetworkImage is working', (tester) async {
    await mockNetworkImagesFor(() async {
      await showPinnedPostScreen(tester);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });


}
