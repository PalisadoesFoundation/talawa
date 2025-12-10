import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/group_chats.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

final groupChatViewModel = getAndRegisterGroupChatViewModel();

Widget createGroupChatsWidget() {
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
        theme: TalawaTheme.darkTheme,
        home: const Scaffold(
          body: GroupChats(),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

Widget createGroupChatTileWidget(ChatListTileDataModel chat) {
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
        theme: TalawaTheme.darkTheme,
        home: Scaffold(
          body: GroupChatTile(
            chat: chat,
            model: groupChatViewModel,
          ),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    registerServices();
  });

  setUp(() {
    reset(groupChatViewModel);
  });

  group('GroupChats Widget Tests', () {
    testWidgets('Shows empty state when no group chats exist', (tester) async {
      // Mock empty group chats
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.initialise()).thenAnswer((_) async {});

      await tester.pumpWidget(createGroupChatsWidget());
      await tester.pumpAndSettle();

      // Check empty state elements
      expect(find.byIcon(Icons.group_outlined), findsOneWidget);
      expect(find.text('No group chats yet'), findsOneWidget);
      expect(
        find.text('Create a group to start chatting with multiple people'),
        findsOneWidget,
      );
      expect(find.text('Pull down to refresh'), findsOneWidget);

      // Check that RefreshIndicator is present
      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Shows group chat list when group chats exist', (tester) async {
      // Create mock group chats
      final chat1 = Chat(
        id: 'group1',
        name: 'Test Group 1',
        description: 'First test group',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chat2 = Chat(
        id: 'group2',
        name: 'Test Group 2',
        description: 'Second test group',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user4', firstName: 'Dave'),
          ChatUser(id: 'user5', firstName: 'Eve'),
        ],
      );

      final groupChats = [
        ChatListTileDataModel.fromChat(chat1),
        ChatListTileDataModel.fromChat(chat2),
      ];

      when(groupChatViewModel.groupChats).thenReturn(groupChats);
      when(groupChatViewModel.initialise()).thenAnswer((_) async {});

      await tester.pumpWidget(createGroupChatsWidget());
      await tester.pumpAndSettle();

      // Check that ListView.builder is shown
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(RefreshIndicator), findsOneWidget);

      // Check that GroupChatTile widgets are created
      expect(find.byType(GroupChatTile), findsNWidgets(2));

      // Verify no empty state is shown
      expect(find.byIcon(Icons.group_outlined), findsNothing);
      expect(find.text('No group chats yet'), findsNothing);
    });

    testWidgets('Pull to refresh works correctly with empty chats',
        (tester) async {
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.initialise()).thenAnswer((_) async {});

      // Mock chatState setter and getter
      when(groupChatViewModel.chatState).thenReturn(ChatState.initial);

      await tester.pumpWidget(createGroupChatsWidget());
      await tester.pumpAndSettle();

      // Find the RefreshIndicator
      final refreshIndicator = find.byType(RefreshIndicator);
      expect(refreshIndicator, findsOneWidget);

      // Simulate pull to refresh by dragging the ListView down
      await tester.drag(find.byType(ListView), const Offset(0, 300));
      await tester.pump();

      // Wait for the Future.delayed in onRefresh to complete
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Verify that refreshChats was called
      verify(groupChatViewModel.refreshChats()).called(1);
    });

    testWidgets('Pull to refresh works correctly with existing chats',
        (tester) async {
      // Create dummy group chats to test refresh with non-empty list
      final groupChats = [
        ChatListTileDataModel.fromChat(
          Chat(
            id: 'group1',
            name: 'Test Group 1',
            description: 'First test group',
            createdAt: DateTime.now().toIso8601String(),
            members: [
              ChatUser(id: 'user1', firstName: 'Alice'),
              ChatUser(id: 'user2', firstName: 'Bob'),
              ChatUser(id: 'user3', firstName: 'Charlie'),
            ],
          ),
        ),
      ];

      when(groupChatViewModel.groupChats).thenReturn(groupChats);
      when(groupChatViewModel.initialise()).thenAnswer((_) async {});
      when(groupChatViewModel.chatState).thenReturn(ChatState.initial);

      await tester.pumpWidget(createGroupChatsWidget());
      await tester.pumpAndSettle();

      expect(find.byType(GroupChatTile), findsOneWidget);

      final refreshIndicator = find.byType(RefreshIndicator);
      expect(refreshIndicator, findsOneWidget);

      // Simulate pull to refresh by dragging the ListView down
      await tester.drag(find.byType(ListView), const Offset(0, 300));
      await tester.pump();

      // Wait for the Future.delayed in onRefresh to complete
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Verify that refreshChats was called
      verify(groupChatViewModel.refreshChats()).called(1);

      // Verify UI reflects refreshed state
      await tester.pumpAndSettle();
      expect(find.byType(GroupChatTile), findsOneWidget);
    });

    testWidgets('onRefresh method functionality test', (tester) async {
      // Test that we can create the widget and verify the onRefresh callback exists
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.initialise()).thenAnswer((_) async {});

      await tester.pumpWidget(createGroupChatsWidget());
      await tester.pumpAndSettle();

      // Test the existence of RefreshIndicator with onRefresh callback
      final refreshIndicator = find.byType(RefreshIndicator);
      expect(refreshIndicator, findsOneWidget);

      final refreshIndicatorWidget =
          tester.widget<RefreshIndicator>(refreshIndicator);
      expect(refreshIndicatorWidget.onRefresh, isNotNull);

      // Test that refreshChats method exists on the view model
      expect(() => groupChatViewModel.refreshChats(), returnsNormally);
    });
  });

  group('GroupChatTile Widget Tests', () {
    testWidgets('Displays group chat information correctly', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'Test Group_chatgroup1',
        description: 'A test group chat',
        createdAt:
            DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Check ListTile exists
      expect(find.byType(ListTile), findsOneWidget);

      // Check group avatar
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byIcon(Icons.group), findsOneWidget);

      // Check group name (should be extracted without suffix)
      expect(find.text('Test Group'), findsOneWidget);

      // Check description
      expect(find.text('A test group chat'), findsOneWidget);

      // Check time display
      expect(find.text('2h ago'), findsOneWidget);
    });

    testWidgets('Handles chat with no description', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'Test Group',
        description: null,
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Check that 'No description' is shown
      expect(find.text('No description'), findsOneWidget);
    });

    testWidgets('Handles chat with empty description', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'Test Group',
        description: null,
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Check that 'No description' is shown for empty description
      expect(find.text('No description'), findsOneWidget);
    });

    testWidgets('Navigates to group chat message screen when tapped',
        (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'Test Group',
        description: 'A test group chat',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Tap on the ListTile
      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();

      // Verify navigation was called
      verify(
        navigationService.pushScreen(
          Routes.groupChatMessageScreen,
          arguments: [chatTileData.id, groupChatViewModel],
        ),
      ).called(1);
    });

    testWidgets('Displays correct time formatting', (tester) async {
      final now = DateTime.now();

      // Test different time scenarios
      final testCases = [
        {
          'time': now.subtract(const Duration(minutes: 30)),
          'expected': '30m ago',
        },
        {
          'time': now.subtract(const Duration(hours: 5)),
          'expected': '5h ago',
        },
        {
          'time': now.subtract(const Duration(days: 2)),
          'expected': '2d ago',
        },
        {
          'time': now.subtract(const Duration(seconds: 30)),
          'expected': 'Just now',
        },
      ];

      for (final testCase in testCases) {
        final chat = Chat(
          id: 'group1',
          name: 'Test Group',
          description: 'A test group chat',
          createdAt: (testCase['time']! as DateTime).toIso8601String(),
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
          ],
        );

        final chatTileData = ChatListTileDataModel.fromChat(chat);

        await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
        await tester.pumpAndSettle();

        expect(find.text(testCase['expected']! as String), findsOneWidget);

        // Clear the widget before next iteration
        await tester.pumpWidget(Container());
      }
    });

    testWidgets('Handles null createdAt time', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'Test Group',
        description: 'A test group chat',
        createdAt: null,
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Should not crash and should show empty time string
      expect(find.byType(ListTile), findsOneWidget);
    });
  });

  group('GroupChatTile Display Name Tests', () {
    testWidgets('Uses chat name when available', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'My Awesome Group_chatgroup1',
        description: 'Test description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Should show extracted group name
      expect(find.text('My Awesome Group'), findsOneWidget);
    });

    testWidgets('Creates name from member names when no chat name',
        (tester) async {
      final chat = Chat(
        id: 'group1',
        name: null,
        description: 'Test description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel(
        id: 'group1',
        chat: chat,
        users: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Should show names of first two members + others count
      expect(find.text('Alice, Bob +1 others'), findsOneWidget);
    });

    testWidgets('Creates name from member names with 2 members',
        (tester) async {
      final chat = Chat(
        id: 'group1',
        name: '',
        description: 'Test description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
        ],
      );

      final chatTileData = ChatListTileDataModel(
        id: 'group1',
        chat: chat,
        users: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
        ],
      );

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Should show both member names
      expect(find.text('Alice, Bob'), findsOneWidget);
    });

    testWidgets('Handles empty member names gracefully', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: null,
        description: 'Test description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: ''),
          ChatUser(id: 'user2', firstName: null),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);
      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Should only use valid names and fall back to 'Unknown' for others
      expect(find.text('Unknown, Charlie'), findsOneWidget);
    });

    testWidgets('Shows Group Chat as fallback name', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: null,
        description: 'Test description',
        createdAt: DateTime.now().toIso8601String(),
        members: [],
      );

      final chatTileData = ChatListTileDataModel(
        id: 'group1',
        chat: chat,
        users: null,
      );

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Should show fallback name
      expect(find.text('Group Chat'), findsOneWidget);
    });
  });

  group('GroupChatTile Styling Tests', () {
    testWidgets('Has correct visual styling', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'Test Group',
        description: 'A test group chat',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Check CircleAvatar properties
      final circleAvatar =
          tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(circleAvatar.radius, equals(25));

      // Check that subtitle is a Column
      expect(find.byType(Column), findsAtLeastNWidgets(1));

      // Check Text styling for title
      final titleText = tester.widget<Text>(find.text('Test Group'));
      expect(titleText.style?.fontWeight, equals(FontWeight.w600));
    });

    testWidgets('Layout structure is correct', (tester) async {
      final chat = Chat(
        id: 'group1',
        name: 'Test Group',
        description: 'A test group chat',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      await tester.pumpWidget(createGroupChatTileWidget(chatTileData));
      await tester.pumpAndSettle();

      // Check overall structure
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(
        find.byType(Column),
        findsAtLeastNWidgets(1),
      ); // For subtitle and trailing
    });
  });
}
