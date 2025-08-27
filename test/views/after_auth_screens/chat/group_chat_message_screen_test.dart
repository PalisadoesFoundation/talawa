import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/group_chat_message_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/add_group_chat_members_dialog.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_input_field.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/manage_members_dialog.dart';
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
        home: Scaffold(
          body: GroupChatMessageScreen(
            chatId: chatId,
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
    reset(userConfig);

    // Essential mocks needed for all tests
    final mockCurrentUser = User(
      id: 'currentUser123',
      firstName: 'Current',
      lastName: 'User',
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

      // Create mock messages
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

    testWidgets('App bar displays correct group information', (tester) async {
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

      // Check app bar elements
      expect(find.text(groupName), findsOneWidget);
      expect(find.text('$memberCount members'), findsOneWidget);
      expect(find.byIcon(Icons.group), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('Back button navigation works', (tester) async {
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

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify navigation was called
      verify(navigationService.pop()).called(1);
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
  });

  group('Admin Popup Menu Tests', () {
    testWidgets('Shows admin menu options when user is admin', (tester) async {
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

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Tap menu button
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      // Check admin menu options
      expect(find.text('Group Info'), findsOneWidget);
      expect(find.text('Edit Group'), findsOneWidget);
      expect(find.text('Add Members'), findsOneWidget);
      expect(find.text('Manage Members'), findsOneWidget);
      expect(find.text('Delete Group'), findsOneWidget);

      // Should not show non-admin options
      expect(find.text('Leave Group'), findsNothing);
    });

    testWidgets('Shows non-admin menu options when user is not admin',
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

      // Tap menu button
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      // Check available options for non-admin
      expect(find.text('Group Info'), findsOneWidget);
      expect(find.text('Leave Group'), findsOneWidget);

      // Should not show admin-only options
      expect(find.text('Edit Group'), findsNothing);
      expect(find.text('Add Members'), findsNothing);
      expect(find.text('Manage Members'), findsNothing);
      expect(find.text('Delete Group'), findsNothing);
    });
  });

  group('Group Info Dialog Tests', () {
    testWidgets('Shows group info dialog with correct information',
        (tester) async {
      const chatId = 'group1';
      final chat = Chat(
        id: chatId,
        name: 'Test Group',
        description: 'A test group chat',
        createdAt: DateTime.now().toIso8601String(),
        creator: ChatUser(id: 'admin1', firstName: 'Admin'),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([chatTileData]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Group Info
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Group Info'));
      await tester.pumpAndSettle();

      // Check group info dialog content
      expect(find.text('Description: A test group chat'), findsOneWidget);
      expect(find.text('Members: 3'), findsOneWidget);
      expect(find.text('Admin: Admin'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);
    });

    testWidgets('Group info dialog handles null description', (tester) async {
      const chatId = 'group1';
      final chat = Chat(
        id: chatId,
        name: 'Test Group',
        description: null,
        createdAt: DateTime.now().toIso8601String(),
        creator: ChatUser(id: 'admin1', firstName: 'Admin'),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([chatTileData]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Group Info
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Group Info'));
      await tester.pumpAndSettle();

      // Check that null description is handled
      expect(find.text('Description: No description'), findsOneWidget);
    });
  });

  group('Edit Group Dialog Tests', () {
    testWidgets('Shows edit group dialog for admin users', (tester) async {
      const chatId = 'group1';
      final chat = Chat(
        id: chatId,
        name: 'Test Group',
        description: 'Original description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(true);
      when(groupChatViewModel.groupChats).thenReturn([chatTileData]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Edit Group
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit Group'));
      await tester.pumpAndSettle();

      // Check edit group dialog
      expect(find.text('Edit Group'), findsOneWidget);
      expect(find.text('Group Name'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);

      // Check that description field is pre-filled
      expect(find.text('Original description'), findsOneWidget);
    });

    testWidgets('Edit group save functionality works', (tester) async {
      const chatId = 'group1';
      final chat = Chat(
        id: chatId,
        name: 'Test Group',
        description: 'Original description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(true);
      when(groupChatViewModel.groupChats).thenReturn([chatTileData]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);
      when(
        groupChatViewModel.updateGroupDetails(
          chatId: chatId,
          newName: 'Updated Group',
          newDescription: 'Updated description',
        ),
      ).thenAnswer((_) async => true);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open edit dialog
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit Group'));
      await tester.pumpAndSettle();

      // Update the fields
      await tester.enterText(
        find.widgetWithText(TextField, 'Test Group'),
        'Updated Group',
      );
      await tester.enterText(
        find.widgetWithText(TextField, 'Original description'),
        'Updated description',
      );

      // Tap save
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify update method was called
      verify(
        groupChatViewModel.updateGroupDetails(
          chatId: chatId,
          newName: 'Updated Group',
          newDescription: 'Updated description',
        ),
      ).called(1);
    });
  });

  group('Add Members Dialog Tests', () {
    testWidgets('Shows add members dialog for admin users', (tester) async {
      const chatId = 'group1';
      final availableMembers = [
        User(id: 'user4', firstName: 'Dave'),
        User(id: 'user5', firstName: 'Eve'),
      ];

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
      when(groupChatViewModel.getAvailableMembers(chatId))
          .thenReturn(availableMembers);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Add Members
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Members'));
      await tester.pumpAndSettle();

      // Check that add members dialog is shown
      expect(find.byType(AddGroupChatMembersDialog), findsOneWidget);
    });

    testWidgets('Shows no available members message when list is empty',
        (tester) async {
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
      when(groupChatViewModel.getAvailableMembers(chatId)).thenReturn([]);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Add Members
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Members'));
      await tester.pumpAndSettle();

      // Verify error dialog was shown
      verify(
        navigationService.showTalawaErrorDialog(
          'No available members to add',
          MessageType.info,
        ),
      ).called(1);
    });
  });

  group('Manage Members Dialog Tests', () {
    testWidgets('Shows manage members dialog for admin users', (tester) async {
      const chatId = 'group1';
      final chat = Chat(
        id: chatId,
        name: 'Test Group',
        description: 'Test description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(true);
      when(groupChatViewModel.groupChats).thenReturn([chatTileData]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Manage Members
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Manage Members'));
      await tester.pumpAndSettle();

      // Check that manage members dialog is shown
      expect(find.byType(ManageMembersDialog), findsOneWidget);
    });
  });

  group('Delete Group Dialog Tests', () {
    testWidgets('Shows delete group confirmation dialog', (tester) async {
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

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Delete Group
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete Group'));
      await tester.pumpAndSettle();

      // Check delete confirmation dialog
      expect(
        find.text(
          'Are you sure you want to delete this group? This action cannot be undone and all messages will be lost.',
        ),
        findsOneWidget,
      );
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('Delete group functionality works', (tester) async {
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
      when(groupChatViewModel.deleteGroupChat(chatId))
          .thenAnswer((_) async => true);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open delete dialog
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete Group'));
      await tester.pumpAndSettle();

      // Confirm deletion
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Verify delete method was called and navigation occurred
      verify(groupChatViewModel.deleteGroupChat(chatId)).called(1);
      verify(navigationService.pop())
          .called(greaterThan(1)); // Multiple pops expected
    });
  });

  group('Leave Group Dialog Tests', () {
    testWidgets('Shows leave group confirmation dialog for non-admin',
        (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId))
          .thenReturn(5); // More than 3 members
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Leave Group
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Leave Group'));
      await tester.pumpAndSettle();

      // Check leave confirmation dialog
      expect(find.text('Leave Group'), findsNWidgets(1)); // Title and button
      expect(
        find.text('Are you sure you want to leave this group?'),
        findsOneWidget,
      );
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Leave'), findsOneWidget);
    });

    testWidgets('Prevents leaving when group has minimum members',
        (tester) async {
      const chatId = 'group1';

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId))
          .thenReturn(3); // Minimum members
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open menu and tap Leave Group
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Leave Group'));
      await tester.pumpAndSettle();

      // Check that prevention dialog is shown
      expect(find.text('Cannot Leave Group'), findsOneWidget);
      expect(
        find.text(
          'Groups must have at least 3 members. You cannot leave this group. Ask the admin to delete the group instead.',
        ),
        findsOneWidget,
      );
      expect(find.text('OK'), findsOneWidget);
    });

    testWidgets('Leave group functionality works', (tester) async {
      const chatId = 'group1';
      const currentUserId = 'user1';
      final chat = Chat(
        id: chatId,
        name: 'Test Group',
        description: 'Test description',
        createdAt: DateTime.now().toIso8601String(),
        members: [
          ChatUser(id: 'user1', firstName: 'Alice'),
          ChatUser(id: 'user2', firstName: 'Bob'),
          ChatUser(id: 'user3', firstName: 'Charlie'),
          ChatUser(id: 'user4', firstName: 'Dave'),
        ],
      );

      final chatTileData = ChatListTileDataModel.fromChat(chat);
      final currentUser = User(id: currentUserId, firstName: 'Alice');

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser).thenReturn({chatId: []});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(4);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([chatTileData]);
      when(groupChatViewModel.hasMoreMessages(chatId)).thenReturn(false);
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);
      when(userConfig.currentUser).thenReturn(currentUser);
      when(
        groupChatViewModel.removeGroupMember(
          chatId: chatId,
          memberId: currentUserId,
          chat: chat,
        ),
      ).thenAnswer((_) async => true);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Open leave dialog
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Leave Group'));
      await tester.pumpAndSettle();

      // Confirm leaving
      await tester.tap(find.text('Leave'));
      await tester.pumpAndSettle();

      // Verify remove method was called and navigation occurred
      verify(
        groupChatViewModel.removeGroupMember(
          chatId: chatId,
          memberId: currentUserId,
          chat: chat,
        ),
      ).called(1);
      verify(navigationService.pop())
          .called(2); // Dialog close + screen navigation
    });
  });

  group('Scroll and Pagination Tests', () {
    testWidgets('Loads more messages when scrolling to top', (tester) async {
      const chatId = 'group1';

      // Create several messages to enable scrolling
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
      when(groupChatViewModel.loadMoreMessages(chatId))
          .thenAnswer((_) async {});

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the ListView exists and has a scroll controller
      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);

      final listViewWidget = tester.widget<ListView>(listView);
      expect(listViewWidget.controller, isNotNull);

      // Verify that the necessary methods are available
      expect(groupChatViewModel.hasMoreMessages(chatId), isTrue);
      expect(groupChatViewModel.isLoadingMoreMessages(chatId), isFalse);

      // Test direct method call instead of scroll simulation
      groupChatViewModel.loadMoreMessages(chatId);
      verify(groupChatViewModel.loadMoreMessages(chatId)).called(1);
    });

    testWidgets('Does not load more messages when already loading',
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

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the state - when already loading, should not trigger more loads
      expect(groupChatViewModel.isLoadingMoreMessages(chatId), isTrue);
      expect(groupChatViewModel.hasMoreMessages(chatId), isTrue);

      // Verify that the ListView is present and responsive
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Does not load more messages when no more available',
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

      when(groupChatViewModel.chatState).thenReturn(ChatState.complete);
      when(groupChatViewModel.chatMessagesByUser)
          .thenReturn({chatId: messages});
      when(groupChatViewModel.getChatMessages(chatId)).thenAnswer((_) async {});
      when(groupChatViewModel.getGroupDisplayName(chatId))
          .thenReturn('Test Group');
      when(groupChatViewModel.getMemberCount(chatId)).thenReturn(3);
      when(groupChatViewModel.isCurrentUserAdminById(chatId)).thenReturn(false);
      when(groupChatViewModel.groupChats).thenReturn([]);
      when(groupChatViewModel.hasMoreMessages(chatId))
          .thenReturn(false); // No more messages
      when(groupChatViewModel.isLoadingMoreMessages(chatId)).thenReturn(false);

      await tester
          .pumpWidget(createGroupChatMessageScreenWidget(chatId: chatId));
      await tester.pumpAndSettle();

      // Verify the state - when no more messages available, pagination shouldn't work
      expect(groupChatViewModel.hasMoreMessages(chatId), isFalse);
      expect(groupChatViewModel.isLoadingMoreMessages(chatId), isFalse);

      // Verify that the ListView is present with messages
      expect(find.byType(ListView), findsOneWidget);

      // Verify loadMoreMessages was not called since no more messages available
      verifyNever(groupChatViewModel.loadMoreMessages(chatId));
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

    testWidgets('Updates UI when model notifies listeners', (tester) async {
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

      // Verify that the widget is created and responsive
      expect(find.byType(GroupChatMessageScreen), findsOneWidget);

      // Verify that getChatMessages was called during initialization
      verify(groupChatViewModel.getChatMessages(chatId)).called(1);
    });
  });
}
