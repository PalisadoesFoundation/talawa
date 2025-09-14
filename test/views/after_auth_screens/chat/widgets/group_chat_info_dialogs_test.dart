import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_info_dialogs.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

final groupChatViewModel = getAndRegisterGroupChatViewModel();
final navigationService = getAndRegisterNavigationService();

Widget createGroupChatInfoDialogsTestWidget({
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
  });

  setUp(() {
    reset(groupChatViewModel);
    reset(navigationService);
  });

  group('GroupChatInfoDialogs Tests', () {
    group('showGroupInfo Tests', () {
      testWidgets('Shows group information dialog with complete data',
          (tester) async {
        final chat = Chat(
          id: 'chat1',
          name: 'Test Group',
          description: 'A test group for testing',
          createdAt: '2023-01-01T10:00:00.000Z',
          members: [
            ChatUser(id: 'user1', firstName: 'Alice'),
            ChatUser(id: 'user2', firstName: 'Bob'),
            ChatUser(id: 'user3', firstName: 'Charlie'),
          ],
        );

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatInfoDialogs.showGroupInfo(context, chat),
                child: const Text('Show Info'),
              ),
            ),
          ),
        );

        // Ensure the widget tree is built
        await tester.pumpAndSettle();

        // Debug: Check if button exists
        expect(find.text('Show Info'), findsOneWidget);

        // Tap button to show dialog
        await tester.tap(find.text('Show Info'));
        await tester.pumpAndSettle();

        // Verify dialog content
        expect(find.byType(AlertDialog), findsOneWidget);
        // Verify content is scrollable to prevent overflow
        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.text('Test Group'), findsOneWidget);
        expect(find.text('Members: 3'), findsOneWidget);
        expect(
          find.text('Description: A test group for testing'),
          findsOneWidget,
        );
        expect(find.textContaining('Created:'), findsOneWidget);
        expect(find.byIcon(Icons.group), findsOneWidget);
        expect(find.text('Close'), findsOneWidget);
      });

      testWidgets('Shows group information dialog with minimal data',
          (tester) async {
        final chat = Chat(
          id: 'chat1',
          name: null,
          description: null,
          createdAt: null,
          members: null,
        );

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    GroupChatInfoDialogs.showGroupInfo(context, chat),
                child: const Text('Show Info'),
              ),
            ),
          ),
        );

        // Ensure the widget tree is built
        await tester.pumpAndSettle();

        // Tap button to show dialog
        await tester.tap(find.text('Show Info'));
        await tester.pumpAndSettle();

        // Verify dialog content with fallback values
        expect(find.byType(AlertDialog), findsOneWidget);
        // Content should be scrollable
        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.text('Group Chat'), findsOneWidget); // Fallback name
        expect(find.text('Members: 0'), findsOneWidget);
        expect(find.text('Description: No description'), findsOneWidget);
        expect(find.text('Close'), findsOneWidget);
        // Created date should not be shown when null
        expect(find.textContaining('Created:'), findsNothing);
      });

      testWidgets('Close button works correctly', (WidgetTester tester) async {
        final chat = Chat(
          id: 'test_chat',
          name: 'Test Chat',
          description: 'Test description',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showGroupInfo(
                  context,
                  chat,
                ),
                child: const Text('Show Info'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Show Info'));
        await tester.pumpAndSettle();

        // Verify dialog opened
        expect(find.textContaining('Members:'), findsOneWidget);

        // Find and tap close button
        await tester.tap(find.text('Close'));
        await tester.pumpAndSettle();

        // Verify dialog closed
        expect(find.textContaining('Members:'), findsNothing);
      });
    });

    group('showEditGroupDialog Tests', () {
      testWidgets('Shows edit group dialog with pre-filled data',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Original Name',
          description: 'Original description',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showEditGroupDialog(
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
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();

        // Verify dialog content
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.byIcon(Icons.edit), findsOneWidget);
        expect(find.text('Group Name'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
        expect(find.text('Cancel'), findsOneWidget);
        expect(find.text('Save'), findsOneWidget);

        // Verify pre-filled text
        expect(find.text('Original Name'), findsOneWidget);
        expect(find.text('Original description'), findsOneWidget);
      });

      testWidgets('Cancel button closes dialog without saving', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showEditGroupDialog(
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

        // Show dialog
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        // Cancel dialog
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsNothing);
        // Verify updateGroupDetails was not called
        verifyZeroInteractions(groupChatViewModel);
      });

      testWidgets('Save button with empty name shows error', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showEditGroupDialog(
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

        // Show dialog
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();

        // Clear the name field
        final nameField = find.byKey(const Key('editGroupNameField'));
        await tester.enterText(nameField, '');

        // Try to save
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        // Verify error message is shown
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Group name cannot be empty',
            MessageType.error,
          ),
        ).called(1);

        // Dialog should still be open
        expect(find.byType(AlertDialog), findsOneWidget);

        // Ensure update wasn’t attempted
        verifyNever(
          groupChatViewModel.updateGroupDetails(
            chatId: chatId,
            newName: anyNamed('newName'),
            newDescription: anyNamed('newDescription'),
          ),
        );
      });

      testWidgets('Save button with valid data calls updateGroupDetails',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Original Name',
          description: 'Original description',
          members: [],
        );

        when(
          groupChatViewModel.updateGroupDetails(
            chatId: chatId,
            newName: 'Updated Name',
            newDescription: 'Updated description',
          ),
        ).thenAnswer((_) async => true);

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showEditGroupDialog(
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

        // Show dialog
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();

        // Update the fields
        final nameField = find.byKey(const Key('editGroupNameField'));
        await tester.enterText(nameField, 'Updated Name');

        final descField = find.byKey(const Key('editGroupDescriptionField'));
        await tester.enterText(descField, 'Updated description');

        // Save changes
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        // Verify update was called
        verify(
          groupChatViewModel.updateGroupDetails(
            chatId: chatId,
            newName: 'Updated Name',
            newDescription: 'Updated description',
          ),
        ).called(1);

        // Verify success message
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Group updated successfully',
            MessageType.info,
          ),
        ).called(1);

        // Dialog should be closed
        expect(find.byType(AlertDialog), findsNothing);
      });

      testWidgets('Save button with empty description saves as null',
          (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Original description',
          members: [],
        );

        when(
          groupChatViewModel.updateGroupDetails(
            chatId: chatId,
            newName: 'Test Group',
            newDescription: null,
          ),
        ).thenAnswer((_) async => true);

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showEditGroupDialog(
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

        // Show dialog
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();

        // Clear description field
        final descField = find.byKey(const Key('editGroupDescriptionField'));
        await tester.enterText(descField, '');

        // Save changes
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        // Verify update was called with null description
        verify(
          groupChatViewModel.updateGroupDetails(
            chatId: chatId,
            newName: 'Test Group',
            newDescription: null,
          ),
        ).called(1);
      });

      testWidgets('Shows error message when update fails', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [],
        );

        when(
          groupChatViewModel.updateGroupDetails(
            chatId: chatId,
            newName: 'Test Group',
            newDescription: 'Test description',
          ),
        ).thenAnswer((_) async => false);

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showEditGroupDialog(
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

        // Show dialog and save
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        // Verify error message
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Failed to update group',
            MessageType.error,
          ),
        ).called(1);
      });

      testWidgets('Text field constraints are properly set', (tester) async {
        const chatId = 'chat1';
        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          description: 'Test description',
          members: [],
        );

        await tester.pumpWidget(
          createGroupChatInfoDialogsTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => GroupChatInfoDialogs.showEditGroupDialog(
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

        // Show dialog
        await tester.tap(find.text('Edit Group'));
        await tester.pumpAndSettle();

        // Check name field constraints
        final nameFieldWidget = tester.widget<TextField>(
          find.byKey(const Key('editGroupNameField')),
        );
        expect(nameFieldWidget.maxLength, equals(50));
        expect(nameFieldWidget.maxLines, equals(1));

        // Check description field constraints
        final descFieldWidget = tester.widget<TextField>(
          find.byKey(const Key('editGroupDescriptionField')),
        );
        expect(descFieldWidget.maxLength, equals(200));
        expect(descFieldWidget.maxLines, equals(3));
      });
    });
  });
}
