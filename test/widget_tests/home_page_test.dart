import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/groups_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/controllers/news_feed_controller.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/router.dart' as router;

Widget createHomePageScreen() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
          create: (_) => GraphQLConfiguration(),
        ),
        ChangeNotifierProvider<OrgController>(
          create: (_) => OrgController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<Preferences>(
          create: (_) => Preferences(),
        ),
        ChangeNotifierProvider<NewsFeedProvider>(
            create: (_) => NewsFeedProvider()),
        ChangeNotifierProvider<GroupController>(
            create: (_) => GroupController()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const HomePage(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;
  setupLocator();

  group('HomePage Widget Test', () {
    testWidgets("Testing if HomePage shows up", (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pump();
      // debugDumpApp();
      // Verify if HomePage Page shows up by checking PersistentTabView.
      expect(find.byType(PersistentTabView), findsOneWidget);
    });

    testWidgets("Testing overflow of New Article in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createHomePageScreen());
      await tester.pump();
      // Verify if HomePage Page shows up by checking PersistentTabView.
      expect(find.byType(PersistentTabView), findsOneWidget);
    });

    testWidgets("Testing overflow of New Article in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createHomePageScreen());
      await tester.pump();
      // Verify if HomePage Page shows up by checking PersistentTabView.
      expect(find.byType(PersistentTabView), findsOneWidget);
    });

    testWidgets('Verifying presence of icons in HomePage', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pump();

      //detecting icons by find.byIcon(Icons.home)
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.chat), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.byIcon(Icons.group), findsOneWidget);
      expect(find.byIcon(Icons.folder), findsOneWidget);
    });

    testWidgets('Verifying if the first page is NEWSFEED', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pump();
      expect(find.byKey(const Key('NEWSFEED_APP_BAR')), findsOneWidget);
      //any other page should not be there
      expect(find.byKey(const Key('GROUPS_APP_BAR')), findsNothing);
    });

    testWidgets('Testing if Groups Page Shows up', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createHomePageScreen());
        await tester.pump();

        //checking if the first page is newsfeed page
        expect(find.byKey(const Key('NEWSFEED_APP_BAR')), findsOneWidget);
        expect(find.byKey(const Key('GROUPS_APP_BAR')), findsNothing);
        final chatIcon = find.byIcon(Icons.chat);

        //tapping the chatIcon
        await tester.tap(chatIcon);
        await tester.pump();

        //Group page should be present
        expect(find.byKey(const Key('GROUPS_APP_BAR')), findsOneWidget);
      });
    });

    testWidgets('Testing if Events Page Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pump();

      //checking if the first page is newsfeed page
      expect(find.byKey(const Key('NEWSFEED_APP_BAR')), findsOneWidget);

      //Events page should be absent
      expect(find.byKey(const Key('EVENTS_APP_BAR')), findsNothing);
      final calendarIcon = find.byIcon(Icons.calendar_today);

      //tapping on calendarIcon
      await tester.tap(calendarIcon);
      await tester.pump();

      //events page should show up
      expect(find.byKey(const Key('EVENTS_APP_BAR')), findsOneWidget);
    });

    testWidgets('Testing if Member Page Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pump();

      //checking if newsfeed page is present
      expect(find.byKey(const Key('NEWSFEED_APP_BAR')), findsOneWidget);
      expect(find.byKey(const Key('ORGANIZATION_APP_BAR')), findsNothing);
      final Finder groupIcon = find.byIcon(Icons.group);
      await tester.tap(groupIcon);
      await tester.pump();

      //Member page should show up
      expect(find.byKey(const Key('ORGANIZATION_APP_BAR')), findsOneWidget);
    });

    testWidgets('Testing if Profile Page Shows up', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createHomePageScreen());
        await tester.pump();

        //checking if newsfeed page is present
        expect(find.byKey(const Key('NEWSFEED_APP_BAR')), findsOneWidget);
        expect(find.byKey(const Key('PROFILE_PAGE_SCAFFOLD')), findsNothing);
        final folderIcon = find.byIcon(Icons.folder);
        await tester.tap(folderIcon);
        await tester.pump();

        //profile page should show up
        expect(find.byKey(const Key('PROFILE_PAGE_SCAFFOLD')), findsOneWidget);
      });
    });
  });
}
