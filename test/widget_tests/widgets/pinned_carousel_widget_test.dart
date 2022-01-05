import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/pinned_carousel_widget.dart';

import '../../helpers/test_locator.dart';

List<Post> pinnedPosts = [
  Post(sId: 'ravidi', creator: User(), description: 'henlo_boi_'),
  Post(sId: 'ravidi', creator: User(), description: 'henlo_boi_' * 10),
];

Widget createPinnedCarouselWidget() {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: PinnedPostCarousel(
        pinnedPosts: pinnedPosts,
        navigateToPinnedPostPage: () {
          navigationService.pushDialog(
            const AlertDialog(),
          );
        },
        navigateToIndividualPostPage:
            () {}, // Since it's not used in the widget file anywhere, so no way of testing it.
      ),
    ),
  );
}

void main() {
  testSetupLocator();
  SizeConfig().test();
  group('Test for PinnedPostCarousel', () {
    testWidgets('Check if the widget shows up', (tester) async {
      await tester.pumpWidget(createPinnedCarouselWidget());
      await tester.pump();

      expect(find.byType(PinnedPostCarousel), findsOneWidget);
    });

    testWidgets('Check for inner children', (tester) async {
      await tester.pumpWidget(createPinnedCarouselWidget());
      await tester.pump();

      expect(
          find.byType(Row), findsNWidgets(2)); // 1 from CustomCarouselScroller
      expect(find.byType(Expanded),
          findsNWidgets(7)); // 4 from CustomCarouselScroller
      expect(find.byType(GestureDetector), findsNWidgets(2));
    });

    testWidgets('Check if texts show up', (tester) async {
      await tester.pumpWidget(createPinnedCarouselWidget());
      await tester.pump();

      expect(find.textContaining("See all Pinned news"), findsOneWidget);
      expect(find.textContaining("henlo_boi_"), findsOneWidget);

      // TODO: uncomment when page view gets implemented

      // await tester.scrollUntilVisible(find.byType(PageView), 10);            // Future reference
      // await tester.pump(const Duration(seconds: 1));                         // Future reference
      // expect(find.textContaining("${'henlo_boi_' * 9}..."), findsOneWidget); // Future reference
    });

    testWidgets('Check if navigating to pinned post works', (tester) async {
      await tester.pumpWidget(createPinnedCarouselWidget());
      await tester.pump();

      expect(find.byType(AlertDialog), findsNothing);

      await tester.tap(find.byType(GestureDetector).last);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
