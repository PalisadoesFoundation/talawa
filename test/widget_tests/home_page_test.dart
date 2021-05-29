import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/views/home_page.dart';

Widget createHomePageScreen() => MaterialApp(
      home: const MainScreen(
        key: Key('homePage'),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;
  setupLocator();

  group('HomePage Widget Test', () {
    testWidgets("Testing if HomePage shows up", (tester) async {
      await tester.pumpWidget(createHomePageScreen());

      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets("Testing overflow in a mobile screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createHomePageScreen());
      // Verify if HomePage Page shows up by checking BottomNavigationBar.
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets("Testing overflow in a tablet screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createHomePageScreen());
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('Verifying presence of icons in HomePage', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
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
      expect(find.text('Newsfeed Screen'), findsOneWidget);
      //any other page should not be there
      expect(find.text('Events Screen'), findsNothing);
    });

    testWidgets('Testing if Events Screen Shows up', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createHomePageScreen());
        //checking if the first page is newsfeed page
        expect(find.text('Newsfeed Screen'), findsOneWidget);
        expect(find.text('Events Screen'), findsNothing);
        final eventIcon = find.byIcon(Icons.event_note);
        //tapping the eventIcon
        await tester.tap(eventIcon);
        await tester.pump();
        // Event Screen should be present
        expect(find.text('Events Screen'), findsOneWidget);
      });
    });

    testWidgets('Testing if Post Screen Shows up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      //checking if the first page is newsfeed page
      expect(find.text('Newsfeed Screen'), findsOneWidget);
      //Post Screen should be absent
      expect(find.text('Post Screen'), findsNothing);
      final postIcon = find.byIcon(Icons.add_box);
      //tapping on postIcon
      await tester.tap(postIcon);
      await tester.pump();
      //Post Screen should show up
      expect(find.text('Post Screen'), findsOneWidget);
    });

    testWidgets('Testing if Chat Screen up', (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      //checking if newsfeed page is present
      expect(find.text('Newsfeed Screen'), findsOneWidget);
      expect(find.text('Chat Screen'), findsNothing);
      final Finder chatIcon = find.byIcon(Icons.chat_bubble_outline);
      await tester.tap(chatIcon);
      await tester.pump();
      expect(find.text('Chat Screen'), findsOneWidget);
    });

    testWidgets('Testing if Profile Screen Shows up', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createHomePageScreen());
        //checking if newsfeed page is present
        expect(find.text('Newsfeed Screen'), findsOneWidget);
        expect(find.text('Profile Screen'), findsNothing);
        final profileIcon = find.byIcon(Icons.account_circle);
        await tester.tap(profileIcon);
        await tester.pump();
        expect(find.text('Profile Screen'), findsOneWidget);
      });
    });
  });
}
