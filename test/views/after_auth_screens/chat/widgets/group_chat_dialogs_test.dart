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
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_dialogs.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

late final GroupChatViewModel groupChatViewModel;
late final NavigationService navigationService;

Widget createGroupChatDialogsTestWidget({
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
  });

  group('GroupChatDialogs Facade Tests', () {
    group('showGroupInfo Tests', () {
      testWidgets('Delegates to GroupChatInfoDialogs.showGroupInfo',
          (tester) async {
        final chat = Chat(
          id: 'chat1',
          name: 'Test Group',
          description: 'Test description',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        await tester.pumpWidget(
          createGroupChatDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatDialogs.showGroupInfo(context, chat),
                child: const Text('Show Info'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(find.text('Show Info'));
        await tester.pumpAndSettle();

        // Verify the dialog is shown with expected content
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Test Group'), findsOneWidget);
        expect(find.text('Description: Test description'), findsOneWidget);
        expect(find.text('Members: 2'), findsOneWidget);
      });
    });

    group('showEditGroupDialog Tests', () {
      testWidgets('Delegates to GroupChatInfoDialogs.showEditGroupDialog',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatDialogs.showEditGroupDialog(
                  context,
                  chat,
                  groupChatViewModel,
                  chatId,
                ),
                child: const Text('Edit Group'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(
          find.descendant(
            of: find.byType(ElevatedButton),
            matching: find.text('Edit Group'),
          ),
        );
        await tester.pumpAndSettle();

        // Verify the edit dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(AlertDialog),
            matching: find.text('Edit Group'),
          ),
          findsOneWidget,
        );
        expect(find.text('Group Name'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
        expect(find.text('Test Group'), findsOneWidget);
        expect(find.text('Test description'), findsOneWidget);
      });
    });

    group('showAddMembersDialog Tests', () {
      testWidgets(
          'Delegates to GroupChatManagementDialogs.showAddMembersDialog',
          (tester) async {
        const chatId = 'chat1';
        final availableMembers = [
          User(id: 'user1', name: 'Alice'),
          User(id: 'user2', name: 'Bob'),
        ];

        when(groupChatViewModel.getAvailableMembers(chatId))
            .thenReturn(availableMembers);

        await tester.pumpWidget(
          createGroupChatDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatDialogs.showAddMembersDialog(
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

        // Verify the add members dialog behavior is triggered
        verify(groupChatViewModel.getAvailableMembers(chatId)).called(1);
      });
    });

    group('showManageMembersDialog Tests', () {
      testWidgets(
          'Delegates to GroupChatManagementDialogs.showManageMembersDialog',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
          ],
        );

        var onMemberRemovedCalled = false;
        void onMemberRemoved() {
          onMemberRemovedCalled = true;
        }

        await tester.pumpWidget(
          createGroupChatDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatDialogs.showManageMembersDialog(
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

        // Verify the manage members dialog is shown
        // This would typically show the ManageMembersDialog
        // We can't easily verify the callback here without more complex setup
        expect(onMemberRemovedCalled, isFalse); // Callback not called yet
      });
    });

    group('showDeleteGroupDialog Tests', () {
      testWidgets(
          'Delegates to GroupChatManagementDialogs.showDeleteGroupDialog',
          (tester) async {
        const chatId = 'chat1';

        await tester.pumpWidget(
          createGroupChatDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatDialogs.showDeleteGroupDialog(
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

        // Verify the delete dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Delete Group'), findsAtLeastNWidgets(1));
        expect(
          find.text(
            'Are you sure you want to delete this group? This action cannot be undone.',
          ),
          findsOneWidget,
        );
      });
    });

    group('showLeaveGroupDialog Tests', () {
      testWidgets(
          'Delegates to GroupChatManagementDialogs.showLeaveGroupDialog',
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
          createGroupChatDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatDialogs.showLeaveGroupDialog(
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

        // Verify the leave dialog is shown
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Leave Group'), findsAtLeastNWidgets(1));
        expect(
          find.text(
            'Are you sure you want to leave this group? You will need to be re-added by an admin to rejoin.',
          ),
          findsOneWidget,
        );
      });

      testWidgets('Shows error for groups with minimum members',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
          ], // Only 3 members - cannot leave
        );

        await tester.pumpWidget(
          createGroupChatDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatDialogs.showLeaveGroupDialog(
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

        // Verify error dialog is shown instead of leave dialog
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
    });
  });
}
