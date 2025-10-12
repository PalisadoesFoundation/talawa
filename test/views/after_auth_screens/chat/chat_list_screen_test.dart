import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/create_group_bottom_sheet.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';
import 'package:talawa/views/after_auth_screens/chat/group_chats.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createChatListScreen() {
  return MaterialApp(
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
      GlobalCupertinoLocalizations.delegate,
    ],
    home: const ChatPage(),
    navigatorKey: getAndRegisterNavigationService().navigatorKey,
    onGenerateRoute: router.generateRoute,
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    sizeConfig.test();
  });

  setUp(() {
    registerServices();
    getAndRegisterDirectChatViewModel();
    getAndRegisterGroupChatViewModel();
    // Register SelectContactViewModel for navigation test if not already registered
    if (!locator.isRegistered<SelectContactViewModel>()) {
      locator.registerFactory(() => SelectContactViewModel());
    }
  });

  tearDown(() {
    unregisterServices();
    // Unregister SelectContactViewModel if registered
    if (locator.isRegistered<SelectContactViewModel>()) {
      locator.unregister<SelectContactViewModel>();
    }
    // Unregister GroupChatViewModel if registered
    if (locator.isRegistered<GroupChatViewModel>()) {
      locator.unregister<GroupChatViewModel>();
    }
  });

  group('ChatPage Widget Tests', () {
    testWidgets('should render ChatPage widget with all main components',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Verify that the main widget is rendered
        expect(find.byType(ChatPage), findsOneWidget);

        // Verify Scaffold is present
        expect(find.byType(Scaffold), findsOneWidget);

        // Verify AppBar is present
        expect(find.byType(AppBar), findsOneWidget);

        // Verify AppBar title
        expect(find.text('Chats'), findsOneWidget);

        // Verify TabBar is present
        expect(find.byType(TabBar), findsOneWidget);

        // Verify both tabs are present
        expect(find.text('Direct'), findsOneWidget);
        expect(find.text('Groups'), findsOneWidget);

        // Verify TabBarView is present
        expect(find.byType(TabBarView), findsOneWidget);

        // Verify DirectChats widget is present (default tab)
        expect(find.byType(DirectChats), findsOneWidget);

        // Verify AnimatedBuilder for FAB is present - be more specific
        expect(find.byType(AnimatedBuilder), findsWidgets);

        // Verify FloatingActionButton.extended is present
        expect(find.byType(FloatingActionButton), findsOneWidget);

        // Verify initial FAB shows contact icon (Direct tab is active)
        expect(find.byIcon(Icons.contacts), findsOneWidget);

        // Verify initial FAB has "Chat" label
        expect(find.text('Chat'), findsOneWidget);
      });
    });

    testWidgets('should verify AppBar styling and TabBar configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Get the AppBar widget
      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);

      final AppBar appBar = tester.widget<AppBar>(appBarFinder);

      // Verify AppBar properties
      expect(appBar.elevation, 0.0);
      expect(appBar.centerTitle, true);

      // Verify TabBar is in the bottom of AppBar
      expect(appBar.bottom, isA<TabBar>());
      final TabBar tabBar = appBar.bottom! as TabBar;
      expect(tabBar.tabs.length, 2); // Should have 2 tabs now
      expect(tabBar.tabs.first, isA<Tab>());
      expect(tabBar.tabs.last, isA<Tab>());
    });

    testWidgets(
        'should verify TabController with correct length and functionality',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Verify TabBar has 2 tabs
      final tabBarFinder = find.byType(TabBar);
      expect(tabBarFinder, findsOneWidget);

      final TabBar tabBar = tester.widget<TabBar>(tabBarFinder);
      expect(tabBar.tabs.length, 2);

      // Verify TabBarView has correct children
      final tabBarViewFinder = find.byType(TabBarView);
      expect(tabBarViewFinder, findsOneWidget);

      // Initially DirectChats should be visible
      expect(find.byType(DirectChats), findsOneWidget);
      expect(find.byType(GroupChats), findsNothing); // Not visible initially
    });

    testWidgets('should switch between Direct and Groups tabs correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Initially should show Direct tab
        expect(find.byType(DirectChats), findsOneWidget);
        expect(find.byIcon(Icons.contacts), findsOneWidget);
        expect(find.text('Chat'), findsOneWidget);

        // Tap on Groups tab
        await tester.tap(find.text('Groups'));
        await tester.pumpAndSettle();

        // Should now show Groups tab
        expect(find.byType(GroupChats), findsOneWidget);
        expect(find.byIcon(Icons.group_add), findsOneWidget);
        expect(find.text('Create Group'), findsOneWidget);

        // Tap back to Direct tab
        await tester.tap(find.text('Direct'));
        await tester.pumpAndSettle();

        // Should show Direct tab again
        expect(find.byType(DirectChats), findsOneWidget);
        expect(find.byIcon(Icons.contacts), findsOneWidget);
        expect(find.text('Chat'), findsOneWidget);
      });
    });

    testWidgets(
        'should verify FloatingActionButton changes based on active tab',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Test Direct tab FAB
        final fabFinder = find.byType(FloatingActionButton);
        expect(fabFinder, findsOneWidget);

        // Verify Direct tab FAB properties
        expect(find.byIcon(Icons.contacts), findsOneWidget);
        expect(find.text('Chat'), findsOneWidget);

        // Switch to Groups tab
        await tester.tap(find.text('Groups'));
        await tester.pumpAndSettle();

        // Verify Groups tab FAB properties
        expect(find.byIcon(Icons.group_add), findsOneWidget);
        expect(find.text('Create Group'), findsOneWidget);
        expect(
          find.byIcon(Icons.contacts),
          findsNothing,
        ); // Should not be present anymore
      });
    });

    testWidgets(
        'should handle Direct chat FAB tap and navigate to select contact',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Ensure we're on Direct tab
        expect(find.text('Direct'), findsOneWidget);
        expect(find.byIcon(Icons.contacts), findsOneWidget);

        // Find and tap the FloatingActionButton
        final fabFinder = find.byType(FloatingActionButton);
        expect(fabFinder, findsOneWidget);

        await tester.tap(fabFinder);
        await tester.pump();

        // Verify the FAB is still present (no errors occurred)
        expect(fabFinder, findsOneWidget);
      });
    });

    testWidgets('should handle Groups FAB tap and show create group dialog',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Switch to Groups tab
        await tester.tap(find.text('Groups'));
        await tester.pumpAndSettle();

        // Verify we're on Groups tab
        expect(find.byIcon(Icons.group_add), findsOneWidget);
        expect(find.text('Create Group'), findsOneWidget);

        // Find and tap the FloatingActionButton
        final fabFinder = find.byType(FloatingActionButton);
        expect(fabFinder, findsOneWidget);

        await tester.tap(fabFinder);
        await tester.pumpAndSettle();

        // Verify the bottom sheet is shown
        expect(find.byType(CreateGroupBottomSheet), findsOneWidget);
      });
    });

    testWidgets('should verify create group bottom sheet properties',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Switch to Groups tab
        await tester.tap(find.text('Groups'));
        await tester.pumpAndSettle();

        // Tap the FloatingActionButton to show dialog
        final fabFinder = find.byType(FloatingActionButton);
        await tester.tap(fabFinder);
        await tester.pumpAndSettle();

        // Verify CreateGroupBottomSheet is present
        expect(find.byType(CreateGroupBottomSheet), findsOneWidget);
      });
    });

    testWidgets('should verify FloatingActionButton heroTag for Direct tab',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Get the FloatingActionButton widget on Direct tab
      final fabFinder = find.byType(FloatingActionButton);
      expect(fabFinder, findsOneWidget);

      final FloatingActionButton fab =
          tester.widget<FloatingActionButton>(fabFinder);

      // Verify heroTag is set correctly for Direct tab
      expect(fab.heroTag, equals("chat_list_fab"));
    });

    testWidgets('should verify icon colors are white for both FABs',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Test Direct tab icon color
        final contactsIcon = tester.widget<Icon>(find.byIcon(Icons.contacts));
        expect(contactsIcon.color, Colors.white);

        // Switch to Groups tab
        await tester.tap(find.text('Groups'));
        await tester.pumpAndSettle();

        // Test Groups tab icon color
        final groupAddIcon = tester.widget<Icon>(find.byIcon(Icons.group_add));
        expect(groupAddIcon.color, Colors.white);
      });
    });

    testWidgets('should verify widget hierarchy structure is correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Verify the widget hierarchy structure
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(ChatPage), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);

      // Verify Scaffold contains AppBar, body, and floatingActionButton
      final scaffoldFinder = find.byType(Scaffold);
      expect(
        find.descendant(
          of: scaffoldFinder,
          matching: find.byType(AppBar),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: scaffoldFinder,
          matching: find.byType(TabBarView),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: scaffoldFinder,
          matching: find.byType(FloatingActionButton),
        ),
        findsOneWidget,
      );
    });

    testWidgets('should verify text styling in AppBar title',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Find the title text widget
      final titleFinder = find.descendant(
        of: find.byType(AppBar),
        matching: find.text('Chats'),
      );
      expect(titleFinder, findsOneWidget);

      // Get the Text widget
      final Text titleText = tester.widget<Text>(titleFinder);

      // Verify text styling properties
      expect(titleText.style?.fontWeight, FontWeight.w600);
      expect(titleText.style?.fontSize, 20);
    });

    testWidgets('should verify StatefulWidget lifecycle methods',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Verify the widget is built correctly (implicitly tests initState)
      expect(find.byType(ChatPage), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);

      // Remove the widget to test dispose
      await tester.pumpWidget(Container());
      await tester.pumpAndSettle();

      // Widget should be disposed without errors
      expect(find.byType(ChatPage), findsNothing);
    });

    testWidgets(
        'should verify TabBarView contains both DirectChats and GroupChats',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Get the TabBarView widget
        final tabBarViewFinder = find.byType(TabBarView);
        expect(tabBarViewFinder, findsOneWidget);

        // Initially DirectChats should be visible
        expect(find.byType(DirectChats), findsOneWidget);

        // Switch to Groups tab to verify GroupChats
        await tester.tap(find.text('Groups'));
        await tester.pumpAndSettle();

        expect(find.byType(GroupChats), findsOneWidget);
      });
    });

    testWidgets(
        'should verify FloatingActionButton responds to tab controller changes',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Verify FAB content changes based on tab selection
        expect(find.byIcon(Icons.contacts), findsOneWidget);

        // Change tab and verify FAB content updates
        await tester.tap(find.text('Groups'));
        await tester.pumpAndSettle();

        // Should now show group_add icon
        expect(find.byIcon(Icons.group_add), findsOneWidget);
        expect(find.byIcon(Icons.contacts), findsNothing);
      });
    });
  });
}
