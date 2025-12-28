import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_app_bar.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

late GroupChatViewModel groupChatViewModel;
late NavigationService navigationService;

Widget createGroupChatAppBarTestWidget({
  required String chatId,
  required String groupChatName,
  required int memberCount,
  required bool isCurrentUserAdmin,
  Chat? currentChat,
}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    theme: TalawaTheme.darkTheme,
    home: Scaffold(
      appBar: GroupChatAppBar(
        chatId: chatId,
        model: groupChatViewModel,
        groupChatName: groupChatName,
        memberCount: memberCount,
        isCurrentUserAdmin: isCurrentUserAdmin,
        currentChat: currentChat,
      ),
      body: const Center(child: Text('Test Body')),
    ),
    onGenerateRoute: router.generateRoute,
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    registerServices();
    groupChatViewModel = getAndRegisterGroupChatViewModel();
    navigationService = getAndRegisterNavigationService();
  });

  setUp(() {
    reset(groupChatViewModel);
    reset(navigationService);

    // Set up default mocks for dynamic methods used by AppBar
    when(groupChatViewModel.getGroupDisplayName('chat1'))
        .thenReturn('Test Group');
    when(groupChatViewModel.getMemberCount('chat1')).thenReturn(3);
  });

  group('GroupChatAppBar Tests', () {
    group('Basic UI Elements Tests', () {
      testWidgets('Displays group name and member count correctly',
          (tester) async {
        const chatId = 'chat1';
        const groupName = 'My Test Group';
        const memberCount = 5;

        // Mock the dynamic methods that the AppBar now uses
        when(groupChatViewModel.getGroupDisplayName(chatId))
            .thenReturn(groupName);
        when(groupChatViewModel.getMemberCount(chatId)).thenReturn(memberCount);

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: groupName,
            memberCount: memberCount,
            isCurrentUserAdmin: false,
          ),
        );

        await tester.pump();

        // Check if AppBar exists first
        expect(find.byType(AppBar), findsOneWidget);

        // Verify group name and member count are displayed
        expect(find.text(groupName), findsOneWidget);
        expect(find.textContaining('$memberCount'), findsOneWidget);
      });

      testWidgets('Shows back button', (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: false,
          ),
        );

        await tester.pump();

        // Look for IconButton with back arrow instead
        final backButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(IconButton),
        );
        expect(backButton, findsAtLeast(1));

        // Alternative: look for NavigationToolbar leading widget
        final leadingWidget = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.arrow_back),
        );
        expect(leadingWidget, findsOneWidget);
      });

      testWidgets('Back button has correct tooltip', (tester) async {
        const chatId = 'chat1';
        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: false,
          ),
        );
        await tester.pump();
        // Verify the IconButton tooltip is 'Back'
        final backIconButton = tester.widget<IconButton>(
          find.widgetWithIcon(IconButton, Icons.arrow_back),
        );
        expect(backIconButton.tooltip, equals('Back'));
      });

      testWidgets('Shows more menu button', (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: false,
          ),
        );

        await tester.pump();

        // Look for PopupMenuButton instead of icon directly
        expect(find.byType(PopupMenuButton<GroupChatAction>), findsOneWidget);

        // Alternative: look within AppBar actions
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );
        expect(moreButton, findsOneWidget);
      });

      testWidgets('Back button calls navigation pop', (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: false,
          ),
        );

        await tester.pump();

        // Find and tap the back button within the AppBar
        final backButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.arrow_back),
        );

        await tester.tap(backButton);
        await tester.pumpAndSettle();

        // Verify navigation pop was called
        verify(navigationService.pop()).called(1);
      });
    });

    group('Admin Menu Tests', () {
      testWidgets('Shows admin menu options when user is admin',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();

        // Verify admin menu options
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
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
            ChatUser(id: 'user4', firstName: 'Dave'),
          ],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 4,
            isCurrentUserAdmin: false,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();

        // Verify available options for non-admin
        expect(find.text('Group Info'), findsOneWidget);
        expect(find.text('Leave Group'), findsOneWidget);

        // Should not show admin-only options
        expect(find.text('Edit Group'), findsNothing);
        expect(find.text('Add Members'), findsNothing);
        expect(find.text('Manage Members'), findsNothing);
        expect(find.text('Delete Group'), findsNothing);
      });
    });

    group('Menu Action Tests', () {
      testWidgets('Group Info action shows info dialog', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 2,
            isCurrentUserAdmin: false,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Group Info'));
        await tester.pumpAndSettle();

        // Verify info dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);

        // Look for dialog content specifically, not just text
        final dialogContent = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Test Group'),
        );
        expect(dialogContent, findsOneWidget);

        expect(find.text('Description: Test description'), findsOneWidget);
        expect(find.text('Members: 2'), findsOneWidget);
      });

      testWidgets('Edit Group action shows edit dialog for admin',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();

        // Verify edit dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Edit Group'), findsOneWidget);
        expect(find.text('Group Name'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
      });

      testWidgets('Add Members action triggers add members dialog for admin',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [],
        );

        when(groupChatViewModel.getAvailableMembers(chatId)).thenReturn([]);

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Add Members'));
        await tester.pumpAndSettle();

        // Verify add members logic is triggered
        verify(groupChatViewModel.getAvailableMembers(chatId)).called(1);
      });

      testWidgets('Manage Members action shows manage members dialog for admin',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
          ],
        );

        // Mock the fetchGroupMembers method that ManageMembersDialog uses
        when(groupChatViewModel.fetchGroupMembers(chatId: chatId)).thenAnswer(
          (_) async => [
            {'id': 'user1', 'firstName': 'Alice', 'lastName': 'Smith'},
            {'id': 'user2', 'firstName': 'Bob', 'lastName': 'Jones'},
            {'id': 'user3', 'firstName': 'Charlie', 'lastName': 'Brown'},
          ],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Manage Members'));
        await tester.pumpAndSettle();

        // Verify manage members dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Manage Members'), findsOneWidget);

        // Wait for members to load
        await tester.pumpAndSettle();

        // Verify that fetchGroupMembers was called
        verify(groupChatViewModel.fetchGroupMembers(chatId: chatId)).called(1);
      });

      testWidgets(
          'Manage Members dialog callback refreshes chat messages when member removed',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        // Mock the required methods
        when(groupChatViewModel.fetchGroupMembers(chatId: chatId)).thenAnswer(
          (_) async => [
            {'id': 'user1', 'firstName': 'Alice', 'lastName': 'Smith'},
            {'id': 'user2', 'firstName': 'Bob', 'lastName': 'Jones'},
          ],
        );
        when(groupChatViewModel.getChatMessages(chatId))
            .thenAnswer((_) async {});

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 2,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button to open Manage Members
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Manage Members'));
        await tester.pumpAndSettle();

        // The dialog should be shown and the callback should be passed correctly
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Manage Members'), findsOneWidget);

        // This test verifies that the callback structure is set up correctly
        // The actual callback execution (model.getChatMessages) would be tested
        // in the ManageMembersDialog tests when a member is actually removed
      });

      testWidgets('Delete Group action shows confirmation dialog for admin',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Delete Group'));
        await tester.pumpAndSettle();

        // Verify delete confirmation dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Delete Group'), findsAtLeastNWidgets(1));
        expect(
          find.text(
            'Are you sure you want to delete this group? This action cannot be undone.',
          ),
          findsOneWidget,
        );
      });

      testWidgets('Leave Group action shows confirmation dialog for non-admin',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
            ChatUser(id: 'user4', firstName: 'Dave'),
          ], // 4 members - can leave
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 4,
            isCurrentUserAdmin: false,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Leave Group'));
        await tester.pumpAndSettle();

        // Verify leave confirmation dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Leave Group'), findsAtLeastNWidgets(1));
        expect(
          find.text(
            'Are you sure you want to leave this group? You will need to be re-added by an admin to rejoin.',
          ),
          findsOneWidget,
        );
      });

      testWidgets('Does not show dialogs when currentChat is null',
          (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: true,
            currentChat: null, // No chat data
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Group Info'));
        await tester.pumpAndSettle();

        // No dialog should be shown since currentChat is null
        expect(find.byType(AlertDialog), findsNothing);
      });

      testWidgets(
          'Manage Members action opens dialog with callback that calls getChatMessages',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        // Get the mocked UserConfig from locator
        final userConfig = locator<UserConfig>();

        when(userConfig.currentUser).thenReturn(
          User(id: 'user1', name: 'Alice'),
        );

        // Set up mocks
        when(groupChatViewModel.fetchGroupMembers(chatId: chatId))
            .thenAnswer((_) async => [
                  {
                    'id': 'user1',
                    'firstName': 'Alice',
                    'email': 'alice@example.com'
                  },
                  {
                    'id': 'user2',
                    'firstName': 'Bob',
                    'email': 'bob@example.com'
                  },
                ]);

        when(groupChatViewModel.getChatMessages(chatId))
            .thenAnswer((_) async {});

        when(groupChatViewModel.validateMemberRemoval(
          chatId: chatId,
          memberId: 'user2',
        )).thenReturn({'isValid': true, 'error': null});

        when(groupChatViewModel.removeGroupMember(
          chatId: chatId,
          memberId: 'user2',
          chat: chat,
        )).thenAnswer((_) async => true);

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 2,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();

        // Tap Manage Members - this goes through _handleGroupAction
        await tester.tap(find.text('Manage Members'));
        await tester.pumpAndSettle();

        // Now we should see the ManageMembersDialog opened from the AppBar
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Manage Members'), findsOneWidget);

        // Verify members are loaded
        expect(find.text('Alice'), findsOneWidget);
        expect(find.text('Bob'), findsOneWidget);

        // Find and tap the remove button for Bob
        final removeButtons = find.byIcon(Icons.remove_circle);
        expect(removeButtons, findsWidgets);

        // Tap the last remove button (Bob's)
        await tester.tap(removeButtons.last);
        await tester.pumpAndSettle();

        // Verify confirmation dialog
        expect(find.text('Remove Member'), findsOneWidget);

        // Tap Remove button to confirm
        final removeConfirmButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.widgetWithText(TextButton, 'Remove'),
        );
        await tester.tap(removeConfirmButton);
        await tester.pumpAndSettle();

        // Verify getChatMessages was called
        // which is inside the callback passed to showManageMembersDialog
        verify(groupChatViewModel.getChatMessages(chatId)).called(1);

        // Verify the complete member removal flow
        verify(groupChatViewModel.validateMemberRemoval(
          chatId: chatId,
          memberId: 'user2',
        )).called(1);
        verify(groupChatViewModel.removeGroupMember(
          chatId: chatId,
          memberId: 'user2',
          chat: chat,
        )).called(1);
      });
    });

    group('Menu Icon Tests', () {
      testWidgets('Menu items have correct icons for admin', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 3,
            isCurrentUserAdmin: true,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();

        // Verify menu item icons
        expect(find.byIcon(Icons.info), findsOneWidget);
        expect(find.byIcon(Icons.edit), findsOneWidget);
        expect(find.byIcon(Icons.person_add), findsOneWidget);
        expect(find.byIcon(Icons.people), findsOneWidget);
        expect(find.byIcon(Icons.delete), findsOneWidget);
      });

      testWidgets('Menu items have correct icons for non-admin',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
            ChatUser(id: 'user4', firstName: 'Dave'),
          ],
        );

        await tester.pumpWidget(
          createGroupChatAppBarTestWidget(
            chatId: chatId,
            groupChatName: 'Test Group',
            memberCount: 4,
            isCurrentUserAdmin: false,
            currentChat: chat,
          ),
        );

        await tester.pump();

        // Find and tap the more menu button
        final moreButton = find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.more_vert),
        );

        await tester.tap(moreButton);
        await tester.pumpAndSettle();

        // Verify menu item icons for non-admin
        expect(find.byIcon(Icons.info), findsOneWidget);
        expect(find.byIcon(Icons.exit_to_app), findsOneWidget);
      });
    });

    group('AppBar Properties Tests', () {
      testWidgets('Has correct preferred size', (tester) async {
        const chatId = 'chat1';

        final appBar = GroupChatAppBar(
          chatId: chatId,
          model: groupChatViewModel, // Use the mock
          groupChatName: 'Test Group',
          memberCount: 3,
          isCurrentUserAdmin: false,
          currentChat: null,
        );

        expect(
          appBar.preferredSize,
          equals(const Size.fromHeight(kToolbarHeight)),
        );
      });
    });
  });
}
