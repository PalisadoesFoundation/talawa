import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';

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
  });

  group('ChatPage Widget Tests', () {
    testWidgets('should render ChatPage widget with all components',
        (WidgetTester tester) async {
      // Mock network images to avoid network calls during tests
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Verify that the main widget is rendered
        expect(find.byType(ChatPage), findsOneWidget);

        // Verify DefaultTabController is present
        expect(find.byType(DefaultTabController), findsOneWidget);

        // Verify Scaffold is present
        expect(find.byType(Scaffold), findsOneWidget);

        // Verify AppBar is present
        expect(find.byType(AppBar), findsOneWidget);

        // Verify AppBar title
        expect(find.text('Chats'), findsOneWidget);

        // Verify TabBar is present
        expect(find.byType(TabBar), findsOneWidget);

        // Verify Tab with "Direct" text
        expect(find.text('Direct'), findsOneWidget);

        // Verify TabBarView is present
        expect(find.byType(TabBarView), findsOneWidget);

        // Verify DirectChats widget is present
        expect(find.byType(DirectChats), findsOneWidget);

        // Verify FloatingActionButton is present
        expect(find.byType(FloatingActionButton), findsOneWidget);

        // Verify FloatingActionButton has the correct icon
        expect(find.byIcon(Icons.contacts), findsOneWidget);

        // Verify FloatingActionButton has the correct label
        expect(find.text('Chat'), findsOneWidget);
      });
    });

    testWidgets('should verify AppBar styling and properties',
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
      expect(tabBar.tabs.length, 1);
      expect(tabBar.tabs.first, isA<Tab>());
    });

    testWidgets('should verify FloatingActionButton styling and properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Get the FloatingActionButton widget
      final fabFinder = find.byType(FloatingActionButton);
      expect(fabFinder, findsOneWidget);

      final FloatingActionButton fab =
          tester.widget<FloatingActionButton>(fabFinder);

      // Verify it's an extended FAB
      expect(fab, isA<FloatingActionButton>());

      // Verify the icon color is white
      final iconFinder = find.descendant(
        of: fabFinder,
        matching: find.byType(Icon),
      );
      expect(iconFinder, findsOneWidget);

      final Icon icon = tester.widget<Icon>(iconFinder);
      expect(icon.icon, Icons.contacts);
      expect(icon.color, Colors.white);
    });

    testWidgets('should verify DefaultTabController has correct length',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Get the DefaultTabController widget
      final tabControllerFinder = find.byType(DefaultTabController);
      expect(tabControllerFinder, findsOneWidget);

      final DefaultTabController tabController =
          tester.widget<DefaultTabController>(tabControllerFinder);

      // Verify tab controller has length of 1
      expect(tabController.length, 1);
    });

    testWidgets('should verify TabBarView contains DirectChats',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Get the TabBarView widget
      final tabBarViewFinder = find.byType(TabBarView);
      expect(tabBarViewFinder, findsOneWidget);

      // Verify DirectChats is a child of TabBarView
      expect(
        find.descendant(
          of: tabBarViewFinder,
          matching: find.byType(DirectChats),
        ),
        findsOneWidget,
      );
    });

    testWidgets('should verify widget hierarchy structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(createChatListScreen());
      await tester.pumpAndSettle();

      // Verify the widget hierarchy structure
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(ChatPage), findsOneWidget);
      expect(find.byType(DefaultTabController), findsOneWidget);
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

    testWidgets('should handle FloatingActionButton tap without errors',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatListScreen());
        await tester.pumpAndSettle();

        // Find the FloatingActionButton
        final fabFinder = find.byType(FloatingActionButton);
        expect(fabFinder, findsOneWidget);

        // Verify the FAB has the correct icon
        final iconFinder = find.descendant(
          of: fabFinder,
          matching: find.byIcon(Icons.contacts),
        );
        expect(iconFinder, findsOneWidget);

        // Tap the FloatingActionButton - should not throw any errors
        await tester.tap(fabFinder);
        await tester.pump(); // Just pump once, don't wait for settle

        // Verify the FAB is still present (no errors occurred)
        expect(fabFinder, findsOneWidget);
      });
    });
  });
}
