import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/group_chat_message_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_app_bar.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_input_field.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

final groupChatViewModel = getAndRegisterGroupChatViewModel();
final userConfig = getAndRegisterUserConfig();

Widget createGroupChatMessageScreenWidget({
  required String chatId,
}) {
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
        home: GroupChatMessageScreen(
          chatId: chatId,
          model: groupChatViewModel,
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
    reset(userConfig);

    // Essential mocks needed for all tests
    final mockCurrentUser = User(
      id: 'currentUser123',
      name: 'Current User',
    );
    when(userConfig.currentUser).thenReturn(mockCurrentUser);
  });

  group('GroupChatMessageScreen Widget Tests', () {
    testWidgets('Shows loading state when chat is loading', (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.loading);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Shows empty state when no messages exist', (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Check empty state elements
      expect(find.byIcon(Icons.group_outlined), findsOneWidget);
      expect(find.text('No messages yet'), findsOneWidget);
      expect(find.text('Start the group conversation!'), findsOneWidget);
    });

    testWidgets('Shows messages when they exist', (tester) async {
      const chatId = 'group1';
      final message1 = ChatMessage(
        id: 'msg1',
        body: 'Hello group!',
        creator: ChatUser(id: 'user1', firstName: 'Alice'),
        chatId: chatId,
        createdAt: DateTime.now().toIso8601String(),
      );

      final message2 = ChatMessage(
        id: 'msg2',
        body: 'Hi everyone!',
        creator: ChatUser(id: 'user2', firstName: 'Bob'),
        chatId: chatId,
        createdAt: DateTime.now().toIso8601String(),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({
        chatId: [message1, message2],
      });
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Check that ListView is shown with messages
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Message), findsNWidgets(2));

      // Verify no empty state is shown
      expect(find.text('No messages yet'), findsNothing);
    });

    testWidgets('Chat input field is present', (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      expect(find.byType(GroupChatInputField), findsOneWidget);
    });

    testWidgets('Group chat app bar is present with correct data',
        (tester) async {
      const chatId = 'group1';
      const groupName = 'Test Group Chat';
      const memberCount = 5;

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn(groupName);
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(memberCount);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Check that GroupChatAppBar is present
      expect(find.byType(GroupChatAppBar), findsOneWidget);
      expect(find.text(groupName), findsOneWidget);
      expect(find.textContaining(memberCount.toString()), findsOneWidget);
    });
  });

  group('Scroll and Pagination Tests', () {
    testWidgets('Scroll controller is properly attached to ListView',
        (tester) async {
      const chatId = 'group1';

      final messages = List.generate(
        20,
        (index) => ChatMessage(
          id: 'msg$index',
          body: 'Message $index',
          creator: ChatUser(id: 'user1', firstName: 'Alice'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(true);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the ListView exists and has a scroll controller
      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);

      final listViewWidget = tester.widget<ListView>(listView);
      expect(listViewWidget.controller, isNotNull);
      expect(
        listViewWidget.reverse,
        isTrue,
      );
    });

    testWidgets('Pagination state is properly handled', (tester) async {
      const chatId = 'group1';
      final messages = List.generate(
        6,
        (index) => ChatMessage(
          id: 'msg$index',
          body: 'Message $index',
          creator: ChatUser(id: 'user1', firstName: 'Alice'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the state - when no more messages available
      expect(groupChatViewModel.hasMoreMessages(chatId), isFalse);
      expect(groupChatViewModel.isLoadingMoreMessages(chatId), isFalse);
      // Verify that the ListView is present with messages
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Message), findsNWidgets(6));
    });

    testWidgets('Does not trigger pagination when chat state is loading',
        (tester) async {
      const chatId = 'group1';
      final messages = List.generate(
        10,
        (index) => ChatMessage(
          id: 'msg$index',
          body: 'Message $index',
          creator: ChatUser(id: 'user1', firstName: 'Alice'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.loading);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(true);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pump();

      // Verify loading indicator is shown
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 150));
      verifyNever(groupChatViewModel.loadMoreMessages(chatId));
    });

    testWidgets('Does not trigger pagination when messages are empty',
        (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(true);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Empty state should be visible
      expect(find.text('No messages yet'), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 150));
      verifyNever(groupChatViewModel.loadMoreMessages(chatId));
    });

    testWidgets('Triggers pagination when scrolling near top', (tester) async {
      const chatId = 'group1';
      final messages = List.generate(
        50,
        (index) => ChatMessage(
          id: 'msg$index',
          body: 'Message $index content that is long enough to take space',
          creator: ChatUser(id: 'user1', firstName: 'Alice'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(true);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.loadMoreMessages(chatId))
          .thenAnswer((_) async {});

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);
      final scrollable = tester.widget<Scrollable>(
        find.descendant(
          of: listView,
          matching: find.byType(Scrollable),
        ),
      );
      final scrollController = scrollable.controller!;
      scrollController.jumpTo(scrollController.position.maxScrollExtent - 100);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 150));

      // Verify loadMoreMessages was called
      verify(groupChatViewModel.loadMoreMessages(chatId)).called(1);
    });

    testWidgets(
        'Does not trigger pagination when already loading more messages',
        (tester) async {
      const chatId = 'group1';
      final messages = List.generate(
        50,
        (index) => ChatMessage(
          id: 'msg$index',
          body: 'Message $index content that is long enough',
          creator: ChatUser(id: 'user1', firstName: 'Alice'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(true);
      when(groupChatViewModel.isLoadingMoreMessages(chatId))
          .thenReturn(true); // Already loading
      when(groupChatViewModel.loadMoreMessages(chatId))
          .thenAnswer((_) async {});

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      final listView = find.byType(ListView);
      final scrollable = tester.widget<Scrollable>(
        find.descendant(
          of: listView,
          matching: find.byType(Scrollable),
        ),
      );
      final scrollController = scrollable.controller!;

      scrollController.jumpTo(scrollController.position.maxScrollExtent - 100);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 150));

      // Should NOT call loadMoreMessages because it's already loading
      verifyNever(groupChatViewModel.loadMoreMessages(chatId));
    });

    testWidgets('Does not trigger pagination when no more messages available',
        (tester) async {
      const chatId = 'group1';
      final messages = List.generate(
        50,
        (index) => ChatMessage(
          id: 'msg$index',
          body: 'Message $index content',
          creator: ChatUser(id: 'user1', firstName: 'Alice'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      final listView = find.byType(ListView);
      final scrollable = tester.widget<Scrollable>(
        find.descendant(
          of: listView,
          matching: find.byType(Scrollable),
        ),
      );
      final scrollController = scrollable.controller!;

      scrollController.jumpTo(scrollController.position.maxScrollExtent - 100);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 150));

      // Should NOT call loadMoreMessages because hasMoreMessages is false
      verifyNever(groupChatViewModel.loadMoreMessages(chatId));
    });
    testWidgets('currentChat returns null when chat not found', (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      // Empty groupChats list means currentChat will be null
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // The screen should still render properly with null currentChat
      expect(find.byType(GroupChatMessageScreen), findsOneWidget);
      expect(find.byType(GroupChatAppBar), findsOneWidget);

      // Verify groupChats was accessed (which triggers the currentChat getter)
      verify(groupChatViewModel.groupChats).called(greaterThan(0));
    });
  });

  group('Widget Lifecycle Tests', () {
    testWidgets('Initializes and loads chat messages on screen load',
        (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify getChatMessages was called during initialization
      verify(groupChatViewModel.getChatMessages(chatId)).called(1);
    });

    testWidgets('Widget responds to model changes', (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pump();

      // Verify that the widget is created
      expect(find.byType(GroupChatMessageScreen), findsOneWidget);
      // Check for AnimatedBuilder that specifically listens to the groupChatViewModel
      // Since there are multiple AnimatedBuilders, we'll check for at least one
      expect(find.byType(AnimatedBuilder), findsAtLeastNWidgets(1));

      // Verify that getChatMessages was called during initialization
      verify(groupChatViewModel.getChatMessages(chatId)).called(1);
    });
  });

  group('Helper Methods Coverage', () {
    testWidgets('All helper getters are accessed during widget lifecycle',
        (tester) async {
      const chatId = 'group1';

      final messages = List.generate(
        5,
        (index) => ChatMessage(
          id: 'msg$index',
          body: 'Message $index',
          creator: ChatUser(id: 'user1', firstName: 'Alice'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(true);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      expect(find.byType(GroupChatAppBar), findsOneWidget);
      verify(groupChatViewModel.chatState).called(greaterThan(0));
      verify(groupChatViewModel.chatMessagesByUser).called(greaterThan(0));
      verify(groupChatViewModel.groupChats).called(greaterThan(0));
      verify(groupChatViewModel.getGroupDisplayName(chatId))
          .called(greaterThan(0));
      verify(groupChatViewModel.isCurrentUserAdminById(chatId))
          .called(greaterThan(0));
      verify(groupChatViewModel.getMemberCount(chatId)).called(greaterThan(0));
    });

    testWidgets('currentChat getter returns chat when found in groupChats',
        (tester) async {
      const chatId = 'group1';

      final mockChat = Chat(
        id: chatId,
      );
      final mockChatTile = ChatListTileDataModel(
        chat: mockChat,
      );

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);

      // Return a list with the mock chat tile - this will cover the where clause
      when(groupChatViewModel.groupChats).thenReturn([mockChatTile]);

      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the widget renders correctly with a non-null currentChat
      expect(find.byType(GroupChatMessageScreen), findsOneWidget);
      expect(find.byType(GroupChatAppBar), findsOneWidget);
      verify(groupChatViewModel.groupChats).called(greaterThan(0));
    });

    testWidgets('currentChat getter returns null when no matching chat',
        (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      // Empty list means no matching chat, so currentChat will be null
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the widget renders correctly even with null currentChat
      expect(find.byType(GroupChatMessageScreen), findsOneWidget);
      expect(find.byType(GroupChatAppBar), findsOneWidget);

      verify(groupChatViewModel.groupChats).called(greaterThan(0));
    });
  });

  testWidgets('Helper methods work correctly', (tester) async {
    const chatId = 'group1';

    when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
    when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
    when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
    when(groupChatViewModel.getGroupDisplayName(chatId))
        .thenReturn('Test Group');
    when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
    when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(true);
    when(groupChatViewModel.groupChats).thenReturn([]);
    when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
    when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

    await tester.pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
    await tester.pumpAndSettle();

    // Verify that helper methods are being called
    verify(groupChatViewModel.chatState).called(greaterThan(0));
    verify(groupChatViewModel.chatMessagesByUser).called(greaterThan(0));
    verify(groupChatViewModel.getGroupDisplayName(chatId))
        .called(greaterThan(0));
    verify(groupChatViewModel.getMemberCount(chatId)).called(greaterThan(0));
    verify(groupChatViewModel.isCurrentUserAdminById(chatId))
        .called(greaterThan(0));
  });

  group('UI Component Tests', () {
    testWidgets('Column layout is properly structured', (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the main structure: Scaffold with Column containing Expanded and input field
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      // Check for at least one Expanded widget instead of exactly one
      expect(find.byType(Expanded), findsAtLeastNWidgets(1));
      expect(find.byType(GroupChatInputField), findsOneWidget);
    });

    testWidgets('Scaffold has proper app bar and body', (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.appBar, isNotNull);
      expect(scaffold.body, isNotNull);
    });
  });
}
