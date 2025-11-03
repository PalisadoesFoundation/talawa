import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';

import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/add_group_chat_members_dialog.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_management_dialogs.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/manage_members_dialog.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

final groupChatViewModel = getAndRegisterGroupChatViewModel();
final navigationService = getAndRegisterNavigationService();
final userConfig = getAndRegisterUserConfig();

Widget createGroupChatManagementDialogsTestWidget({
  required Widget child,
}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    theme: TalawaTheme.darkTheme,
    home: Scaffold(body: child),
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
    reset(navigationService);
    reset(userConfig);
  });

  group('GroupChatManagementDialogs Tests', () {
    group('showAddMembersDialog Tests', () {
      testWidgets('Shows add members dialog when available members exist',
          (tester) async {
        const chatId = 'chat1';
        final availableMembers = [
          User(id: 'user1', name: 'Alice Smith'),
          User(id: 'user2', name: 'Bob Jones'),
        ];

        when(groupChatViewModel.getAvailableMembers(chatId))
            .thenReturn(availableMembers);

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showAddMembersDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Add Members'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(find.text('Add Members'));
        await tester.pumpAndSettle();

        // Verify dialog is shown
        expect(find.byType(AddGroupChatMembersDialog), findsOneWidget);
      });

      testWidgets('onMembersSelected callback executes addSelectedMembers',
          (tester) async {
        const chatId = 'chat1';
        final availableMembers = [
          User(id: 'user1', name: 'Alice Smith'),
          User(id: 'user2', name: 'Bob Jones'),
        ];

        when(groupChatViewModel.getAvailableMembers(chatId))
            .thenReturn(availableMembers);

        // Mock the addGroupMember calls
        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user1',
          ),
        ).thenAnswer((_) async => true);

        when(groupChatViewModel.getChatMessages(chatId))
            .thenAnswer((_) async {});

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showAddMembersDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Add Members'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(find.text('Add Members'));
        await tester.pumpAndSettle();

        // Verify dialog is shown
        expect(find.byType(AddGroupChatMembersDialog), findsOneWidget);

        // Simulate onMembersSelected callback by finding and interacting with the dialog
        // This should trigger the callback which calls addSelectedMembers
        final dialog = tester.widget<AddGroupChatMembersDialog>(
          find.byType(AddGroupChatMembersDialog),
        );

        // Trigger the callback manually to cover the line
        dialog.onMembersSelected([availableMembers.first]);
        await tester.pumpAndSettle();

        // Verify that addGroupMember was called (which happens in addSelectedMembers)
        verify(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user1',
          ),
        ).called(1);
      });

      testWidgets('Shows error when no available members exist',
          (tester) async {
        const chatId = 'chat1';

        when(groupChatViewModel.getAvailableMembers(chatId)).thenReturn([]);

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showAddMembersDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Add Members'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Tap button
        await tester.tap(find.text('Add Members'));
        await tester.pumpAndSettle();

        // Verify error dialog is shown
        verify(
          navigationService.showTalawaErrorSnackBar(
            'No available members to add',
            MessageType.warning,
          ),
        ).called(1);

        // Dialog should not be shown
        expect(find.byType(AddGroupChatMembersDialog), findsNothing);
      });
    });

    group('showManageMembersDialog Tests', () {
      testWidgets('Shows manage members dialog', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        void onMemberRemoved() {
          // Callback for member removal
        }

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showManageMembersDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                  chat,
                  onMemberRemoved,
                ),
                child: const Text('Manage Members'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(find.text('Manage Members'));
        await tester.pumpAndSettle();

        // Verify dialog is shown
        expect(find.byType(ManageMembersDialog), findsOneWidget);
      });
    });

    group('showDeleteGroupDialog Tests', () {
      testWidgets('Shows delete group confirmation dialog', (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showDeleteGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Delete Group'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(find.text('Delete Group'));
        await tester.pumpAndSettle();

        // Verify dialog content
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Delete Group'), findsAtLeastNWidgets(1));
        expect(
          find.text(
            'Are you sure you want to delete this group? This action cannot be undone.',
          ),
          findsOneWidget,
        );
        expect(find.text('Cancel'), findsOneWidget);
        expect(find.text('Delete'), findsOneWidget);
      });

      testWidgets('Cancel button in delete dialog calls Navigator.pop',
          (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showDeleteGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Delete Group'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Show dialog
        await tester.tap(find.text('Delete Group'));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        // Find the Cancel TextButton specifically and tap it
        final cancelButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.widgetWithText(TextButton, 'Cancel'),
        );
        expect(cancelButton, findsOneWidget);
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();

        // Dialog should be closed
        expect(find.byType(AlertDialog), findsNothing);
        // Verify deleteGroupChat was not called
        verifyZeroInteractions(groupChatViewModel);
      });

      testWidgets('Cancel button closes dialog without action', (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showDeleteGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Delete Group'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Show dialog
        await tester.tap(find.text('Delete Group'));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        // Cancel dialog using descendant finder
        final cancelButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Cancel'),
        );
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsNothing);
        // Verify deleteGroupChat was not called
        verifyZeroInteractions(groupChatViewModel);
      });

      testWidgets('Delete button calls deleteGroupChat on success',
          (tester) async {
        const chatId = 'chat1';

        when(groupChatViewModel.deleteGroupChat(chatId))
            .thenAnswer((_) async => true);

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showDeleteGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Delete Group'),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Show dialog and confirm deletion
        await tester.tap(find.text('Delete Group'));
        await tester.pumpAndSettle();

        // Find the Delete button within the dialog
        final deleteButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Delete'),
        );
        await tester.tap(deleteButton);
        await tester.pumpAndSettle();

        // Verify delete was called
        verify(groupChatViewModel.deleteGroupChat(chatId)).called(1);

        // Verify success message and navigation
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Group deleted successfully',
            MessageType.info,
          ),
        ).called(1);
        verify(navigationService.pop()).called(1);
      });

      testWidgets('Delete button shows error on failure', (tester) async {
        const chatId = 'chat1';

        when(groupChatViewModel.deleteGroupChat(chatId))
            .thenAnswer((_) async => false);

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showDeleteGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Delete Group'),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Show dialog and confirm deletion
        await tester.tap(find.text('Delete Group'));
        await tester.pumpAndSettle();

        // Find and tap the Delete button within the dialog using descendant
        final deleteButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Delete'),
        );
        await tester.tap(deleteButton);
        await tester.pumpAndSettle();

        // Verify error message
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Failed to delete group',
            MessageType.error,
          ),
        ).called(1);

        // Navigation should not be called
        verifyNever(navigationService.pop());
      });
    });

    group('showLeaveGroupDialog Tests', () {
      testWidgets('Shows error when group has minimum members', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
          ], // Only 3 members
        );

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showLeaveGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                  chat,
                ),
                child: const Text('Leave Group'),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Tap button
        await tester.tap(find.text('Leave Group'));
        await tester.pumpAndSettle();

        // Verify error dialog is shown
        verify(
          navigationService.showTalawaErrorDialog(
            'Cannot Leave Group',
            MessageType.error,
          ),
        ).called(1);

        // Leave dialog should not be shown
        expect(
          find.text('Are you sure you want to leave this group?'),
          findsNothing,
        );
      });

      testWidgets('Shows leave group confirmation dialog', (tester) async {
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
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showLeaveGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                  chat,
                ),
                child: const Text('Leave Group'),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(find.text('Leave Group'));
        await tester.pumpAndSettle();

        // Verify dialog content
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Leave Group'), findsAtLeastNWidgets(1));
        expect(
          find.text(
            'Are you sure you want to leave this group? You will need to be re-added by an admin to rejoin.',
          ),
          findsOneWidget,
        );
        expect(find.text('Cancel'), findsOneWidget);
        expect(find.text('Leave'), findsOneWidget);
      });

      testWidgets('Cancel button in leave dialog calls Navigator.pop',
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
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showLeaveGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                  chat,
                ),
                child: const Text('Leave Group'),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Show dialog
        await tester.tap(find.text('Leave Group'));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        // Find the Cancel TextButton specifically and tap it
        final cancelButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.widgetWithText(TextButton, 'Cancel'),
        );
        expect(cancelButton, findsOneWidget);
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();

        // Dialog should be closed
        expect(find.byType(AlertDialog), findsNothing);
        // Verify leaveGroupChat was not called
        verifyZeroInteractions(groupChatViewModel);
      });

      testWidgets('Leave button calls leaveGroupChat on success',
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

        when(groupChatViewModel.leaveGroupChat(chatId, chat))
            .thenAnswer((_) async => true);

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showLeaveGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                  chat,
                ),
                child: const Text('Leave Group'),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Show dialog and confirm leaving
        await tester.tap(find.text('Leave Group'));
        await tester.pumpAndSettle();

        // Find and tap the Leave button within the dialog using descendant
        final leaveButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Leave'),
        );
        await tester.tap(leaveButton);
        await tester.pumpAndSettle();

        // Verify leave was called
        verify(groupChatViewModel.leaveGroupChat(chatId, chat)).called(1);

        // Verify success message and navigation
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Left group successfully',
            MessageType.info,
          ),
        ).called(1);
        verify(navigationService.pop()).called(1);
      });

      testWidgets('Leave button shows error on failure', (tester) async {
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

        when(groupChatViewModel.leaveGroupChat(chatId, chat))
            .thenAnswer((_) async => false);

        await tester.pumpWidget(
          createGroupChatManagementDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatManagementDialogs.showLeaveGroupDialog(
                  context,
                  groupChatViewModel,
                  chatId,
                  chat,
                ),
                child: const Text('Leave Group'),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Show dialog and confirm leaving
        await tester.tap(find.text('Leave Group'));
        await tester.pumpAndSettle();

        // Find and tap the Leave button within the dialog using descendant
        final leaveButton = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Leave'),
        );
        await tester.tap(leaveButton);
        await tester.pumpAndSettle();

        // Verify error message
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Failed to leave group',
            MessageType.error,
          ),
        ).called(1);

        // Navigation should not be called
        verifyNever(navigationService.pop());
      });
    });

    group('addSelectedMembers Tests', () {
      testWidgets('Successfully adds all members', (tester) async {
        const chatId = 'chat1';
        final selectedMembers = [
          User(id: 'user1', name: 'Alice'),
          User(id: 'user2', name: 'Bob'),
        ];

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user1',
          ),
        ).thenAnswer((_) async => true);

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user2',
          ),
        ).thenAnswer((_) async => true);

        when(groupChatViewModel.getChatMessages(chatId))
            .thenAnswer((_) async {});

        await GroupChatManagementDialogs.addSelectedMembers(
          selectedMembers,
          groupChatViewModel,
          chatId,
        );

        // Verify all members were added
        verify(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user1',
          ),
        ).called(1);

        verify(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user2',
          ),
        ).called(1);

        // Verify success message
        verify(
          navigationService.showTalawaErrorDialog(
            'Successfully added 2 members',
            MessageType.info,
          ),
        ).called(1);

        // Verify chat refresh
        verify(groupChatViewModel.getChatMessages(chatId)).called(1);
      });

      testWidgets('Handles mixed success and failure results', (tester) async {
        const chatId = 'chat1';
        final selectedMembers = [
          User(id: 'user1', name: 'Alice'),
          User(id: 'user2', name: 'Bob'),
          User(id: 'user3', name: 'Charlie'),
        ];

        final chat = Chat(
          id: chatId,
          members: [
            ChatUser(id: 'user2', firstName: 'Bob'), // Already a member
          ],
        );

        final chatTileData = ChatListTileDataModel.fromChat(chat);

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user1',
          ),
        ).thenAnswer((_) async => true); // Success

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user2',
          ),
        ).thenAnswer((_) async => false); // Already member

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user3',
          ),
        ).thenAnswer((_) async => false); // Failure

        when(groupChatViewModel.groupChats).thenReturn([chatTileData]);
        when(groupChatViewModel.getChatMessages(chatId))
            .thenAnswer((_) async {});

        await GroupChatManagementDialogs.addSelectedMembers(
          selectedMembers,
          groupChatViewModel,
          chatId,
        );

        // Verify mixed result message
        verify(
          navigationService.showTalawaErrorDialog(
            'Added 1, failed 1, already members 1',
            MessageType.info,
          ),
        ).called(1);

        // Should still refresh chat since there was at least one success
        verify(groupChatViewModel.getChatMessages(chatId)).called(1);
      });

      testWidgets('Handles all members already in group', (tester) async {
        const chatId = 'chat1';
        final selectedMembers = [
          User(id: 'user1', name: 'Alice'),
          User(id: 'user2', name: 'Bob'),
        ];

        final chat = Chat(
          id: chatId,
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        final chatTileData = ChatListTileDataModel.fromChat(chat);

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user1',
          ),
        ).thenAnswer((_) async => false);

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user2',
          ),
        ).thenAnswer((_) async => false);

        when(groupChatViewModel.groupChats).thenReturn([chatTileData]);

        await GroupChatManagementDialogs.addSelectedMembers(
          selectedMembers,
          groupChatViewModel,
          chatId,
        );

        // Verify appropriate message
        verify(
          navigationService.showTalawaErrorDialog(
            'All selected members are already in the group',
            MessageType.info,
          ),
        ).called(1);

        // Should not refresh chat since no new members were added
        verifyNever(groupChatViewModel.getChatMessages(chatId));
      });

      testWidgets('Handles all failures', (tester) async {
        const chatId = 'chat1';
        final selectedMembers = [
          User(id: 'user1', name: 'Alice'),
          User(id: 'user2', name: 'Bob'),
        ];

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user1',
          ),
        ).thenAnswer((_) async => false);

        when(
          groupChatViewModel.addGroupMember(
            chatId: chatId,
            userId: 'user2',
          ),
        ).thenAnswer((_) async => false);

        when(groupChatViewModel.groupChats).thenReturn([]);

        await GroupChatManagementDialogs.addSelectedMembers(
          selectedMembers,
          groupChatViewModel,
          chatId,
        );

        // Verify failure message
        verify(
          navigationService.showTalawaErrorDialog(
            'Failed to add members',
            MessageType.info,
          ),
        ).called(1);

        // Should not refresh chat since no members were added
        verifyNever(groupChatViewModel.getChatMessages(chatId));
      });
    });
  });
}
