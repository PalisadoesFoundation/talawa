import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/main_screen.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

Widget createHomePageScreen() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: MainScreen(
      key: const Key('MainScreen'),
      mainScreenArgs: MainScreenArgs(mainScreenIndex: 0),
    ),
    //navigatorKey: navigationService.navigatorKey,
    //onGenerateRoute: router.generateRoute,
  );
}

void main() {
  testSetupLocator();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('HomePage Widget Test', () {
    testWidgets("Testing if HomePage shows up", (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();

      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('Verifying presence of icons in HomePage', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();
      //detecting icons by find.byIcon(Icons.home)
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.event_note), findsOneWidget);
      expect(find.byIcon(Icons.add_box), findsOneWidget);
      expect(find.byIcon(Icons.chat_bubble_outline), findsOneWidget);
      expect(find.byIcon(Icons.account_circle), findsOneWidget);
    });

    testWidgets('Verifying if the first index points to newsfeed',
        (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();
      expect(find.text('Organization Name'), findsWidgets);
    });

    testWidgets('Testing if Events Screen Shows up', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createHomePageScreen());
        await tester.pumpAndSettle();

        final eventIcon = find.byIcon(Icons.event_note);
        //tapping the eventIcon
        await tester.tap(eventIcon);
        await tester.pump();
        await tester.pumpAndSettle();
        // Event Screen should be present
        expect(find.byKey(const Key("ExploreEventsAppBar")), findsOneWidget);
      });
    });
    testWidgets('Testing if Post Screen Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();

      expect(find.text('Post Screen'), findsNothing);
      final postIcon = find.byIcon(Icons.add_box);
      //tapping on postIcon
      await tester.tap(postIcon);
      await tester.pump();
      await tester.pumpAndSettle();
      //Post Screen should show up
      expect(find.text('Share News'), findsOneWidget);
    });

    testWidgets('Testing if Chat Screen up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();

      final Finder chatIcon = find.byIcon(Icons.chat_bubble_outline);
      await tester.tap(chatIcon);
      await tester.pump();
      await tester.pumpAndSettle();
      expect(
        find.byKey(const PageStorageKey('Save-Direct-Chat-Page-Position')),
        findsOneWidget,
      );
    });

    testWidgets('Testing if Profile Screen Shows up', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createHomePageScreen());
        await tester.pumpAndSettle();

        final profileIcon = find.byIcon(Icons.account_circle);
        await tester.tap(profileIcon);
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('ProfilePageAppBar')), findsOneWidget);
      });
    });
  });
}
