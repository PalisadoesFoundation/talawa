import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../lib/controllers/auth_controller.dart';
import '../../lib/controllers/org_controller.dart';
import '../../lib/services/preferences.dart';
import '../../lib/utils/GQLClient.dart';
import '../../lib/views/pages/home_page.dart';

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
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group('HomePage Widget Test', () {
    testWidgets("Testing if HomePage shows up", (tester) async {
      await tester.pumpWidget(createHomePageScreen());

      // Verify if HomePage Page shows up by checking PersistentTabView.
      expect(find.byType(PersistentTabView), findsOneWidget);
    });

    testWidgets("Testing overflow of New Article in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createHomePageScreen());
      // Verify if HomePage Page shows up by checking PersistentTabView.
      expect(find.byType(PersistentTabView), findsOneWidget);
    });

    testWidgets("Testing overflow of New Article in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createHomePageScreen());
      // Verify if HomePage Page shows up by checking PersistentTabView.
      expect(find.byType(PersistentTabView), findsOneWidget);
    });

    testWidgets('Verifying presence of icons in HomePage', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      //detecting icons by find.byIcon(Icons.home)
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.chat), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.byIcon(Icons.group), findsOneWidget);
      expect(find.byIcon(Icons.folder), findsOneWidget);
    });

    testWidgets('Verifying if the first page is NEWSFEED', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      expect(find.byKey(Key('NEWSFEED_APP_BAR')), findsOneWidget);
      //any other page should not be there
      expect(find.byKey(Key('GROUPS_APP_BAR')), findsNothing);
    });

    testWidgets('Testing if Groups Page Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      //checking if the first page is newsfeed page
      expect(find.byKey(Key('NEWSFEED_APP_BAR')), findsOneWidget);
      expect(find.byKey(Key('GROUPS_APP_BAR')), findsNothing);
      var chatIcon = find.byIcon(Icons.chat);
      //tapping the chatIcon
      await tester.tap(chatIcon);
      await tester.pumpAndSettle();
      //Group page should be present
      expect(find.byKey(Key('GROUPS_APP_BAR')), findsOneWidget);
    });

    testWidgets('Testing if Events Page Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      //checking if the first page is newsfeed page
      expect(find.byKey(Key('NEWSFEED_APP_BAR')), findsOneWidget);
      //Events page should be absent
      expect(find.byKey(Key('EVENTS_APP_BAR')), findsNothing);
      var calendarIcon = find.byIcon(Icons.calendar_today);
      //tapping on calendarIcon
      await tester.tap(calendarIcon);
      await tester.pump();
      //events page should show up
      expect(find.byKey(Key('EVENTS_APP_BAR')), findsOneWidget);
    });

    testWidgets('Testing if Member Page Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      //checking if newsfeed page is present
      expect(find.byKey(Key('NEWSFEED_APP_BAR')), findsOneWidget);
      expect(find.byKey(Key('ORGANIZATION_APP_BAR')), findsNothing);
      var groupIcon = find.byIcon(Icons.group);
      await tester.tap(groupIcon);
      await tester.pump();
      //Member page should show up
      expect(find.byKey(Key('ORGANIZATION_APP_BAR')), findsOneWidget);
    });

    testWidgets('Testing if Profile Page Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      //checking if newsfeed page is present
      expect(find.byKey(Key('NEWSFEED_APP_BAR')), findsOneWidget);
      expect(find.byKey(Key('PROFILE_PAGE_SCAFFOLD')), findsNothing);
      var folderIcon = find.byIcon(Icons.folder);
      await tester.tap(folderIcon);
      await tester.pump();
      //profile page should show up
      expect(find.byKey(Key('PROFILE_PAGE_SCAFFOLD')), findsOneWidget);
    });
  });
}
