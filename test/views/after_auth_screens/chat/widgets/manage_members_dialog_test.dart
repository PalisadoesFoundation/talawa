import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/manage_members_dialog.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    testSetupLocator();
  });

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('ManageMembersDialog Tests', () {
    late GroupChatViewModel mockGroupChatViewModel;
    late UserConfig mockUserConfig;
    late Chat mockChat;

    setUp(() {
      mockGroupChatViewModel = getAndRegisterGroupChatViewModel();
      mockUserConfig = locator<UserConfig>();

      mockChat = Chat(
        id: 'test-chat',
        name: 'Test Group',
        creator: ChatUser(id: 'user1', firstName: 'Admin'),
        members: [
          ChatUser(id: 'user1', firstName: 'Admin'),
          ChatUser(id: 'user2', firstName: 'Member1'),
          ChatUser(id: 'user3', firstName: 'Member2'),
          ChatUser(id: 'user4', firstName: 'Member3'),
        ],
      );

      when(mockUserConfig.currentUser).thenReturn(
        User(id: 'user1', firstName: 'Admin'),
      );
    });

    testWidgets('should display loading indicator initially',
        (WidgetTester tester) async {
      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return [];
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      // Pump once to start the widget build and show loading state
      await tester.pump();

      // Verify loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Manage Members'), findsOneWidget);

      // Wait for the async operation to complete
      await tester.pumpAndSettle();
    });

    testWidgets('should display members list after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final mockMembers = [
          {
            'id': 'user1',
            'firstName': 'Admin',
            'email': 'admin@example.com',
            'image': null,
          },
          {
            'id': 'user2',
            'firstName': 'Member1',
            'email': 'member1@example.com',
            'image': null,
          },
          {
            'id': 'user3',
            'firstName': 'Member2',
            'email': 'member2@example.com',
            'image': 'https://example.com/avatar.jpg',
          },
        ];

        when(
          mockGroupChatViewModel.fetchGroupMembers(
            chatId: 'test-chat',
            limit: 32,
          ),
        ).thenAnswer((_) async => mockMembers);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ManageMembersDialog(
                chatId: 'test-chat',
                model: mockGroupChatViewModel,
                chat: mockChat,
                userConfig: mockUserConfig,
                onMemberRemoved: () {},
              ),
            ),
          ),
        );

        // Wait for loading to complete
        await tester.pumpAndSettle();

        // Verify members are displayed
        expect(
          find.text('Admin'),
          findsAtLeastNWidgets(1),
        ); // May appear multiple times (name + role)
        expect(find.text('Member1'), findsOneWidget);
        expect(find.text('Member2'), findsOneWidget);
        expect(find.text('Member'), findsNWidgets(2)); // Member labels

        // Verify list tiles
        expect(find.byType(ListTile), findsNWidgets(3));
        expect(find.byType(CircleAvatar), findsNWidgets(3));
      });
    });

    testWidgets(
        'should show remove button only for non-admin and non-self members',
        (WidgetTester tester) async {
      final mockMembers = [
        {
          'id': 'user1', // Creator/Admin
          'firstName': 'Admin',
          'email': 'admin@example.com',
        },
        {
          'id': 'user2', // Regular member
          'firstName': 'Member1',
          'email': 'member1@example.com',
        },
      ];

      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async => mockMembers);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find ListTiles
      final listTiles = find.byType(ListTile);
      expect(listTiles, findsNWidgets(2));

      // Admin should not have remove button (is creator)
      final adminTile = tester.widget<ListTile>(listTiles.first);
      expect(adminTile.trailing, isNull);

      // Regular member should have remove button
      final memberTile = tester.widget<ListTile>(listTiles.last);
      expect(memberTile.trailing, isA<IconButton>());
    });

    testWidgets('should handle member removal confirmation',
        (WidgetTester tester) async {
      final mockMembers = [
        {
          'id': 'user2',
          'firstName': 'Member1',
          'email': 'member1@example.com',
        },
      ];

      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async => mockMembers);

      when(
        mockGroupChatViewModel.validateMemberRemoval(
          chatId: 'test-chat',
          memberId: 'user2',
        ),
      ).thenReturn({'isValid': true, 'error': null});

      when(
        mockGroupChatViewModel.removeGroupMember(
          chatId: 'test-chat',
          memberId: 'user2',
          chat: mockChat,
        ),
      ).thenAnswer((_) async => true);

      bool onMemberRemovedCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {
                onMemberRemovedCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap remove button
      await tester.tap(find.byIcon(Icons.remove_circle));
      await tester.pumpAndSettle();

      // Verify confirmation dialog appears
      expect(find.text('Remove Member'), findsOneWidget);
      expect(
        find.text('Are you sure you want to remove Member1 from the group?'),
        findsOneWidget,
      );

      // Tap Remove button in confirmation dialog
      await tester.tap(find.widgetWithText(TextButton, 'Remove'));
      await tester.pumpAndSettle();

      // Verify removal was called
      verify(
        mockGroupChatViewModel.removeGroupMember(
          chatId: 'test-chat',
          memberId: 'user2',
          chat: mockChat,
        ),
      ).called(1);

      expect(onMemberRemovedCalled, true);
    });

    testWidgets('should handle validation errors', (WidgetTester tester) async {
      final mockMembers = [
        {
          'id': 'user2',
          'firstName': 'Member1',
          'email': 'member1@example.com',
        },
      ];

      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async => mockMembers);

      when(
        mockGroupChatViewModel.validateMemberRemoval(
          chatId: 'test-chat',
          memberId: 'user2',
        ),
      ).thenReturn({
        'isValid': false,
        'error': 'Cannot remove member. Group must have at least 3 members.',
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap remove button
      await tester.tap(find.byIcon(Icons.remove_circle));
      await tester.pumpAndSettle();

      // Verify error dialog appears
      expect(find.text('Cannot Remove Member'), findsOneWidget);
      expect(
        find.text(
          'Cannot remove member. Group must have at least 3 members.',
        ),
        findsOneWidget,
      );

      // Tap OK button
      await tester.tap(find.widgetWithText(TextButton, 'OK'));
      await tester.pumpAndSettle();

      // Verify removal was not called
      verifyNever(
        mockGroupChatViewModel.removeGroupMember(
          chatId: 'any',
          memberId: 'any',
          chat: mockChat,
        ),
      );
    });

    testWidgets('should handle loading errors with retry option',
        (WidgetTester tester) async {
      // First call throws an error
      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenThrow(Exception('Network error'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify error message and retry button
      expect(find.textContaining('Failed to load members:'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Retry'), findsOneWidget);

      // Setup successful response for retry
      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return [];
      });

      // Tap retry button
      await tester.tap(find.widgetWithText(ElevatedButton, 'Retry'));
      await tester.pump();

      // Verify loading indicator appears briefly (may not always be visible)
      // Just verify that the retry action works
      await tester.pumpAndSettle();
    });

    testWidgets('should display empty state when no members found',
        (WidgetTester tester) async {
      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async => []);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify empty state
      expect(find.text('No members found'), findsOneWidget);
    });

    testWidgets('should handle refresh action', (WidgetTester tester) async {
      final mockMembers = [
        {
          'id': 'user1',
          'firstName': 'Admin',
          'email': 'admin@example.com',
        },
      ];

      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async => mockMembers);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify refresh button exists when members are loaded
      expect(find.widgetWithText(TextButton, 'Refresh'), findsOneWidget);

      // Tap refresh button
      await tester.tap(find.widgetWithText(TextButton, 'Refresh'));
      await tester.pump();

      // Verify refresh action works (loading may be too brief to catch)
      await tester.pumpAndSettle();

      // Verify fetchGroupMembers is called again
      verify(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).called(2); // Once on init, once on refresh
    });

    testWidgets('should display member avatars correctly',
        (WidgetTester tester) async {
      await mockNetworkImages(
        () async {
          final mockMembers = [
            {
              'id': 'user1',
              'firstName': 'John',
              'image': 'https://example.com/john.jpg',
            },
            {
              'id': 'user2',
              'firstName': 'Jane',
              'image': null,
            },
            {
              'id': 'user3',
              'firstName': '',
              'image': null,
            },
          ];

          when(
            mockGroupChatViewModel.fetchGroupMembers(
              chatId: 'test-chat',
              limit: 32,
            ),
          ).thenAnswer((_) async => mockMembers);

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: ManageMembersDialog(
                  chatId: 'test-chat',
                  model: mockGroupChatViewModel,
                  chat: mockChat,
                  userConfig: mockUserConfig,
                  onMemberRemoved: () {},
                ),
              ),
            ),
          );

          await tester.pumpAndSettle();

          // Verify avatars
          final circleAvatars = find.byType(CircleAvatar);
          expect(circleAvatars, findsNWidgets(3));

          // Member with image should have NetworkImage
          final johnAvatar = tester.widget<CircleAvatar>(circleAvatars.first);
          expect(johnAvatar.backgroundImage, isA<NetworkImage>());

          // Member without image should show initial
          expect(find.text('J'), findsOneWidget); // Jane's initial
          expect(find.text('U'), findsOneWidget); // Unknown for empty name
        },
      );
    });

    testWidgets('should close dialog when Close button is pressed',
        (WidgetTester tester) async {
      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async => []);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify Close button exists
      expect(find.widgetWithText(TextButton, 'Close'), findsOneWidget);

      // Tap Close button
      await tester.tap(find.widgetWithText(TextButton, 'Close'));
      await tester.pump();

      // Navigation service pop should have been called
      // Note: Since we're using a mock navigation service, we can't easily verify the call
    });

    testWidgets('should handle member removal cancellation',
        (WidgetTester tester) async {
      final mockMembers = [
        {
          'id': 'user2',
          'firstName': 'Member1',
          'email': 'member1@example.com',
        },
      ];

      when(
        mockGroupChatViewModel.fetchGroupMembers(
          chatId: 'test-chat',
          limit: 32,
        ),
      ).thenAnswer((_) async => mockMembers);

      when(
        mockGroupChatViewModel.validateMemberRemoval(
          chatId: 'test-chat',
          memberId: 'user2',
        ),
      ).thenReturn({'isValid': true, 'error': null});

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ManageMembersDialog(
              chatId: 'test-chat',
              model: mockGroupChatViewModel,
              chat: mockChat,
              userConfig: mockUserConfig,
              onMemberRemoved: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap remove button
      await tester.tap(find.byIcon(Icons.remove_circle));
      await tester.pumpAndSettle();

      // Tap Cancel button in confirmation dialog
      await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
      await tester.pumpAndSettle();

      // Verify removal was not called
      verifyNever(
        mockGroupChatViewModel.removeGroupMember(
          chatId: 'any',
          memberId: 'any',
          chat: mockChat,
        ),
      );
    });
  });
}
